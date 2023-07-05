source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.5'
# Use Puma as the app server
gem 'puma', '~> 5'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

gem 'actiontext', require: 'action_text'
gem 'image_processing', '~> 1.2'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
#gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbo-rails'
gem 'stimulus-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'builder'
# Use Redis adapter to run Action Cable in production

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
gem 'sidekiq', '>= 6.2.1'

gem 'sidekiq-client-cli'
gem 'sidekiq-scheduler'

#gem 'whenever', :require => false

gem 'rack', '>= 2.2.3'

gem "importmap-rails", "~> 1.1"
gem 'requestjs-rails'
#gem 'tailwindcss-rails'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'dotenv'
  #gem 'heavens_door'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'rubocop-minitest', require: false
  gem 'erb_lint', require: false
  gem 'bullet'
end

group :development do
    # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  #gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard'
  gem 'guard-minitest'
  gem 'rails_best_practices'
  gem 'guard-rails'
  gem 'pry'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails-erd'
  gem 'ruby-graphviz'
  # Use Capistrano for deployment
  gem 'capistrano', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-nginx', '~> 2.0', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-sidekiq', require: false
  gem "capistrano-db-tasks", require: false
end

group :test do
  gem 'mocha'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'minitest'
  gem 'database_cleaner'
#  gem 'minitest-display', path: '/home/codynivens/devel/minitest-display'
#  , branch: "new-feature"
#  gem 'minitest-parallel_fork'
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'pdf-reader'
  gem 'geckodriver-helper'
  gem 'rails-controller-testing'
  gem 'launchy'
  gem 'simplecov', require: false, group: :test
  gem 'mock_redis'

  # Easy installation and use of chromedriver to run system tests with Chrome

  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'
gem 'cancancan'
gem 'rolify'
gem 'kaminari'
gem 'datagrid'
gem 'nokogiri', '>= 1.13.6'
gem 'mini_portile2'
gem 'acts-as-taggable-on'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails_sortable'
gem 'popper_js'
gem 'bootstrap', '~> 5.1.3'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'wicked_pdf'
gem 'gepub'
gem 'wkhtmltopdf-binary', '0.12.4'
gem 'bootstrap_form', '>= 4.0.0'
gem 'font_awesome5_rails'
gem "font-awesome-sass", "~> 6.4.0"
gem 'timelineJS-rails'
gem 'mini_magick','~> 4.9.4'
gem 'react-rails'
gem 'words_counted', git: 'git@github.com:werthen/words_counted'
#gem 'rails-bootstrap-tabs', git: 'git@github.com:cody-nivens/rails-bootstrap-tab.git'
gem 'rails-bootstrap-tabs', '~> 0.3.2'
gem 'bootstrap-toggle-rails'
#gem 'namey'
gem 'acts_as_list'
gem 'ranked-model', git: 'git@github.com:mixonic/ranked-model'
gem 'chartkick'
gem 'jdbc-mysql',      '~> 5.1.35', :platform => :jruby
gem 'thinking-sphinx', '~> 5.3'
gem 'wicked'
gem 'by_star', git: 'git@github.com:radar/by_star'
gem 'pagy'
gem 'country_select', '~> 6.0'
gem 'rexml'
gem 'better_html'
gem 'bootstrap-tooltip-rails', '~> 0.1'
gem 'mail'
gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'
gem 'net-ssh', '7.0.1'
gem "simple_calendar", "~> 2.4"
gem 'exception_notification'
gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'
gem 'redis-rack-cache'
