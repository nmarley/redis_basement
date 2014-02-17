require "redis"
require "redis_basement/version"

module RedisBasement
  @@redis = Redis.new

    def redis
      @@redis
    end

    def redis_key(resource)
      self.to_s + ":" + resource
    end

    def fetch(resource, expires_in=3600)
      redis_key = redis_key(resource)
      unless response = redis.get(redis_key)
        response = get(resource).body
        redis.set(redis_key, response)
        redis.expire(redis_key, expires_in)
      end
      response
    end
end
