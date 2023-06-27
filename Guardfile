# Defines the matching rules for Guard.
# all_on_start: false               # run all tests in group on startup, default: true
# all_after_pass: true              # run all tests in group after changed specs pass, default: false
# cli: '--test'                     # pass arbitrary Minitest CLI arguments, default: ''
# test_folders: ['tests']           # specify an array of paths that contain test files, default: %w[test spec]
# include: ['lib']                  # specify an array of include paths to the command that runs the tests
# test_file_patterns: %w[test_*.rb] # specify an array of patterns that test files must match in order to be run, default: %w[*_test.rb test_*.rb *_spec.rb]
# spring: true                      # enable spring support, default: false
# zeus: true                        # enable zeus support; default: false
# drb: true                         # enable DRb support, default: false
# bundler: false                    # don't use "bundle exec" to run the minitest command, default: true
# rubygems: true                    # require rubygems when running the minitest command (only if bundler is disabled), default: false
# env: {}                           # specify some environment variables to be set when the test command is invoked, default: {}
# all_env: {}                       # specify additional environment variables to be set when all tests are being run, default: false
# autorun: false                    # require 'minitest/autorun' automatically, default: true

options = {
  spring: 'bin/rails test', # NOTE: true = run all tests on every run
  all_on_start: false,
  autorun: false,
  all_after_pass: false
}
guard :minitest, options do
#guard :minitest, autorun: false, spring: "bin/rails test", all_on_start: false do
  watch(%r{^test/(.*)\/?(.*)_test\.rb$})
  watch('test/test_helper.rb') { 'test' }
  watch('test/application_system_test_case.rb')    { system_tests }
  watch('test/all_controllers.sentinal')    { controller_tests }
  watch('config/routes.rb')    { integration_tests }
  watch('Gemfile.lock') { 'test' }

  watch(%r{^app/(.+)\.rb$})                           { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "test/#{m[1]}#{m[2]}_test.rb" }
  #watch(%r{^app/views/([^/]*?)/(.*)\.html\.erb$}) { |m| ["test/views/#{m[1]}/#{m[2]}.html.erb_test.rb", "test/controllers/#{m[1]}_controller_test.rb"] }
  watch(%r{^app/views/([^/]*?)/(.*)\.html\.erb$}) { |m| "test/controllers/#{m[1]}_controller_test.rb" }
#  watch(%r{^app/views/(acts|locations|actors)/(.*)\.html\.erb$}) { |m| ["test/controllers/#{m[1]}_controller_test.rb", "test/system/stages_test.rb"] }
#  watch(%r{^app/views//(.*)\.html\.erb$}) { |m| "test/controllers/#{m[1]}_controller_test.rb" }

  watch(%r{^lib/(.+)\.rb$})                           { |m| "test/lib/#{m[1]}_test.rb" }
  #watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["test/routing/#{m[1]}_routing_test.rb", "test/#{m[2]}s/#{m[1]}_#{m[2]}_test.rb", "test/system/#{m[1]}_test.rb"] }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["test/#{m[2]}s/#{m[1]}_#{m[2]}_test.rb", "test/system/#{m[1]}_test.rb"] }
  watch(%r{^app/views/shared/(.*)\.turbo_stream\.erb$}) { |m| controller_tests }
  watch(%r{^app/grids/(.*?)_grid\.rb$}) { |m| [ "test/controllers/#{m[1]}_controller_test.rb", "test/system/#{m[1]}_test.rb"] }
  watch('app/views/layouts/application.html.erb') { |m| 'test/integration/site_layout_test.rb' }
  watch('app/views/layouts/_nav_links..html.erb') { |m| 'test/system/menu_walk_test.rb' }
  watch('app/helpers/sessions_helper.rb') { |m| integration_tests << 'test/helpers/sessions_helper_test.rb' }
  watch('app/controllers/sessions_controller.rb') { |m| ['test/controllers/sessions_controller_test.rb', 'test/integration/users_login_test.rb'] }
  watch('app/controllers/account_activations_controller.rb') { |m| 'test/integration/users_signup_test.rb' }
  watch(%r{app/views/users/*}) { |m| resource_tests('users') + ['test/integration/microposts_interface_test.rb'] }
end

# Returns the integration tests corresponding to the given resource.
def integration_tests(resource = :all)
  if resource == :all
    Dir["test/integration/*"]
  else
    Dir["test/integration/#{resource}_flow_test.rb"]
  end
end

# Returns the integration tests corresponding to the given resource.
def system_tests(resource = :all)
  if resource == :all
    Dir["test/system/*"]
  else
    Dir["test/system/#{resource}_test.rb"]
  end
end

# Returns the integration tests corresponding to the given resource.
def view_tests(resource = :all)
  if resource == :all
    Dir["test/views/*/*_test.rb"]
  else
    Dir["test/views/#{resource}/*_test.rb"]
  end
end

# Returns the controller tests corresponding to the given resource.
def controller_tests(resource = :all)
  if resource == :all
    Dir["test/controllers/*_test.rb"]
  else
    Dir["test/controllers/#{resource}_test.rb"]
  end
end

# Returns all tests for the given resource.
def resource_tests(resource)
  integration_tests(resource) << controller_test(resource)  << system_tests(resource) << view_tests(resource)
end
