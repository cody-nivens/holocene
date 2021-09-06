guard :rails, port: 3000, host: '0.0.0.0' do
  watch('Gemfile.lock')
  watch(%r{^(config|lib)/(?!test.sphinx.conf).*})
end

# Defines the matching rules for Guard.
guard :minitest, spring: "bin/rails test", all_on_start: false, env: { 'NO_COVERAGE' => 'true' } do
  watch(%r{^test/(.*)\/?(.*)_test\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^test/test_helper\.rb$})      { 'test' }
  watch('test/test_helper.rb') { 'test' }
  watch('config/routes.rb')    { integration_tests }
  watch(%r{^app/models/(.*?)\.rb$}) do |matches|
    "test/models/#{matches[1]}_test.rb"
  end
  watch(%r{^app/controllers/(.*?)_controller\.rb$}) do |matches|
    resource_tests(matches[1])
  end
  watch('Gemfile.lock') do
    'test'
  end

  watch(%r{^app/views/([^/]*?)/.*\.html\.erb$}) do |matches|
    resource_tests(matches[1])
  end
  watch(%r{^app/grids/(.*?)_grid\.rb$}) do |matches|
    resource_tests(matches[1])
  end
  watch(%r{^app/helpers/(.*?)_helper\.rb$}) do |matches|
      integration_tests(matches[1])
  end
  watch('app/views/layouts/application.html.erb') do
    'test/integration/site_layout_test.rb'
  end
  watch('app/helpers/sessions_helper.rb') do
    integration_tests << 'test/helpers/sessions_helper_test.rb'
  end
  watch('app/controllers/sessions_controller.rb') do
    ['test/controllers/sessions_controller_test.rb',
     'test/integration/users_login_test.rb']
  end
  watch('app/controllers/account_activations_controller.rb') do
    'test/integration/users_signup_test.rb'
  end
  watch(%r{app/views/users/*}) do
    resource_tests('users') +
    ['test/integration/microposts_interface_test.rb']
  end
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

# Returns the controller tests corresponding to the given resource.
def controller_test(resource)
  "test/controllers/#{resource}_controller_test.rb"
end

# Returns all tests for the given resource.
def resource_tests(resource)
  integration_tests(resource) << controller_test(resource) << system_tests(resource)
end
