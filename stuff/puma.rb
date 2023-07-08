app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"
rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env

if rails_env == "development"
  # Puma can serve each request in a thread from an internal thread pool.
  # The `threads` method setting takes two numbers: a minimum and maximum.
  # Any libraries that use thread pools should be configured to match
  # the maximum value specified for Puma. Default is set to 5 threads for minimum
  # and maximum; this matches the default thread size of Active Record.
  #
  threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
  threads threads_count, threads_count

  # Specifies the `port` that Puma will listen on to receive requests; default is 3000.
  #
  port        ENV.fetch("PORT") { 3000 }

  # Allow puma to be restarted by `rails restart` command.
  plugin :tmp_restart
elsif rails_env == 'production'

  bind  "unix://#{shared_dir}/tmp/sockets/puma.sock"
  pidfile "#{shared_dir}/tmp/pids/puma.pid"
  state_path "#{shared_dir}/tmp/sockets/puma.state"
  directory "/var/www/app_name/current"
  stdout_redirect '#{shared_dir}/log/puma.log', '#{shared_dir}/log/puma.log', true

  workers 2
  threads 2,16

  daemonize true

  activate_control_app

  prune_bundler
end
