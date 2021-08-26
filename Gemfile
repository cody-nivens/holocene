source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'

# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.3.8'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

gem "actiontext", require: "action_text"
gem "image_processing", "~> 1.2"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'builder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'sidekiq', '~>6.0.0'
gem 'sidekiq-client-cli'
gem "sidekiq-cron", "~> 1.1"

#gem 'whenever', :require => false

gem "rack", ">= 2.2.3"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'dotenv'

end

group :development do
    # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'simplecov', require: false, group: :test
  gem 'guard'
  gem 'guard-minitest'
  #gem 'guard-spring'
  gem 'guard-rails'
end

group :test do
  gem 'mocha'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'minitest'
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'selenium-webdriver'
  gem 'pdf-reader'
  gem 'geckodriver-helper'
  gem 'rails-controller-testing'
  gem 'launchy'

  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise', '~> 4.7.1'
gem 'rolify'
gem 'kaminari', '~> 1.2.1'
gem 'datagrid'
gem 'nokogiri', '1.10.8'
gem 'mini_portile2', '~> 2.4.0'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails_sortable'
gem "popper_js"
gem 'bootstrap-sass'
gem 'simple_form'
gem 'wicked_pdf'
gem 'gepub'
gem 'wkhtmltopdf-binary', '0.12.4'
gem "bootstrap_form", ">= 4.0.0"
gem "font-awesome-rails"
gem 'font-awesome-sass', '~> 5.5.0'
gem 'timelineJS-rails'
#gem "rgeo"
#gem 'rgeo-activerecord', :git => 'https://github.com/rgeo/rgeo-activerecord'
gem 'mini_magick','~> 4.9.4'
gem 'react-rails'
gem 'words_counted'
gem 'rails-bootstrap-tabs', '~> 0.2.2'
gem 'bootstrap-toggle-rails'
gem 'namey'
gem 'acts_as_list'
gem 'ranked-model'
gem "chartkick"
gem 'jdbc-mysql',      '~> 5.1.35', :platform => :jruby
gem 'thinking-sphinx', '~> 5.3'
