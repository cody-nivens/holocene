#initializers/sidekiq.rb
Redis.exists_returns_integer =  false
schedule_file = "config/schedule.yml"

#if File.exist?(schedule_file) && Sidekiq.server?
if File.exist?(schedule_file)
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end

