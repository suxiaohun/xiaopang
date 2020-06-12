REDIS_CONFIG = {}
REDIS_CONFIG[:host] = XiaopangEnv.redis.host
REDIS_CONFIG[:port] = XiaopangEnv.redis.port
REDIS_CONFIG[:db] = Rails.env.test? ? 3 : 0

redis = Redis.new(REDIS_CONFIG)

RATE_REDIS = Redis::Namespace.new(:rate, redis: redis)
YYS_REDIS = Redis::Namespace.new(:yys, redis: redis)

BOOK_REDIS = Redis::Namespace.new(:book, redis: redis)