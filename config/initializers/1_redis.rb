REDIS_CONFIG = {}
REDIS_CONFIG[:host] = '172.21.0.2'
REDIS_CONFIG[:port] = 6379
REDIS_CONFIG[:db] = Rails.env.test? ? 3 : 0

redis = Redis.new(REDIS_CONFIG)

RATE_REDIS = Redis::Namespace.new(:rate, redis: redis)

BOOK_REDIS = Redis::Namespace.new(:book, redis: redis)