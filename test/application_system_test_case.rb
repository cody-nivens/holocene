require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
    # https://svn.redmine.org/redmine/trunk/test/application_system_test_case.rb
    #
  DOWNLOADS_PATH = File.expand_path(File.join(Rails.root, 'tmp', 'downloads'))

  driven_by :selenium, using: :chrome, screen_size: [1024, 900], options: {
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => {
          'prefs' => {
            'download.default_directory' => DOWNLOADS_PATH,
            'download.prompt_for_download' => false,
            'plugins.plugins_disabled' => ["Chrome PDF Viewer"]
          }
        }
      )
    }

end
