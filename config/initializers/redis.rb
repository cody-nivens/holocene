$redis = Redis::Namespace.new("holocene", :redis => Redis.new(host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'], password: ENV['REDIS_PASS']))
