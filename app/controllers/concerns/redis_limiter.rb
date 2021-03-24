require 'redis'
require 'date'

module StFinanceCloud
  class RedisLimiter
    def initialize(args)
      @redis = $redis_rate_limiter
      init_script
    end

    def limit(uuid, rate_limit, time_window, daily_limit, type='rate_limit')
      unless ['rate_limit', 'idnumber_limit'].include?(type)
        raise 'RedisLimiter limit params type error'
      end

      case type
      when 'idnumber_limit'
        key_count = "user:#{uuid}:idnumber_request_count"
        key_today = "user:#{uuid}:#{Date.today.to_s}:idnumber_request_count"
      else
        key_count = "user:#{uuid}:request_count"
        key_today = "user:#{uuid}:#{Date.today.to_s}:request_count"
      end

      count_window, ttl, count_daily = rate_limit_count!(key_count,
                                                         time_window,
                                                         key_today,
                                                         daily_limit)

      remain_window = rate_limit - count_window

      remain_daily = if daily_limit <= 0
                       2147483647
                     elsif count_daily < 0
                       -1
                     else
                       daily_limit-count_daily
                     end

      [rate_limit, remain_window, ttl, remain_daily]
    end

    BACKOFFS = [0, 0.1, 0.2]
    def rate_limit_count!(key_count, time_window, key_today, daily_limit)
      3.times do |i|
        begin
          return @redis.evalsha(@rate_limit_script_sha,
                                [key_count, key_today],
                                [time_window, daily_limit])
        rescue Redis::CommandError
          sleep BACKOFFS[i]
          init_script
        rescue
          next
        end
      end

      [0, 10, 0]
    end

    private

    def init_script
      script = "
            local count_window = redis.call('incr', KEYS[1])
            local ttl_window   = redis.call('ttl', KEYS[1])
            if ttl_window == -1 then
              redis.call('expire', KEYS[1], ARGV[1])
              ttl_window = tonumber(ARGV[1])
            end

            local count_daily = redis.call('get', KEYS[2])
            local daily_limit = tonumber(ARGV[2])

            if daily_limit == 0 then  -- no limit
              return {count_window, ttl_window, 0}
            end

            if not count_daily or tonumber(count_daily) < daily_limit then
              count_daily = redis.call('incr', KEYS[2])
              if count_daily == 1 then
                redis.call('expire', KEYS[2], 86400)
              end
            else
              count_daily = -1
            end

            return {count_window, ttl_window, count_daily}
      "
      @rate_limit_script_sha = @redis.script(:load, script)
    end
  end
end
