require "test_helper"

DOWNLOADS_PATH = File.expand_path(File.join(Rails.root, 'tmp', 'downloads'))
Capybara.register_driver :headless_selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--window-size=1366,768')

  options.add_preference(:download, directory_upgrade: true,
                                    prompt_for_download: false,
                                    default_directory: DOWNLOADS_PATH)

  options.add_preference(:browser, set_download_behavior: { behavior: 'allow' })

  driver = Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)

  bridge = driver.browser.send(:bridge)

  path = '/session/:session_id/chromium/send_command'
  path[':session_id'] = bridge.session_id

  bridge.http.call(:post, path, cmd: 'Page.setDownloadBehavior',
                                params: {
                                  behavior: 'allow',
                                  downloadPath: DOWNLOADS_PATH
                                })

  driver
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase

  driven_by :headless_selenium

end
