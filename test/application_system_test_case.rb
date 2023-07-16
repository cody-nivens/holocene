require 'test_helper'

Capybara.default_max_wait_time = 30

DOWNLOADS_PATH = File.expand_path(File.join(Rails.root, 'tmp', 'downloads'))
if ENV['NO_HEADLESS']
  token = :selenium
else
  token = :headless_selenium
end
Capybara.register_driver token do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  unless ENV['NO_HEADLESS']
    options.add_argument('--headless')
  end

  options.add_argument('--no-sandbox')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--window-size=1366,1900')

  options.add_preference(:download, directory_upgrade: true,
                         prompt_for_download: false,
                         default_directory: DOWNLOADS_PATH)

  #options.add_preference(:capabilities, Selenium::WebDriver::Remote::Capabilities.chrome(
#  options.add_preference(:capabilities, Selenium::WebDriver::Chrome::Options.new(
#      'prefs' => {
#        'download.default_directory' => DOWNLOADS_PATH,
#        'download.prompt_for_download' => false,
#        'disable_screenshots' => true,
#        'plugins.plugins_disabled' => ['Chrome PDF Viewer']
#    }
#  )
# )
 options.add_preference('download.default_directory', DOWNLOADS_PATH)
 options.add_preference(:download, default_directory: DOWNLOADS_PATH)
#  options.add_preference(:capabilities, Selenium::WebDriver::Chrome::Options.new(
#    'chromeOptions' => {
#      'prefs' => {
#        'download.default_directory' => DOWNLOADS_PATH,
#        'download.prompt_for_download' => false,
#        'disable_screenshots' => true,
#        'plugins.plugins_disabled' => ['Chrome PDF Viewer']
#      }
#    }
#  )
#  )
  options.add_preference(:browser, set_download_behavior: { behavior: 'allow' })

  service = Selenium::WebDriver::Service.chrome(args: ["--verbose", '--log_path /tmp/chromedriver.log'])
  driver = Capybara::Selenium::Driver.new(app, browser: :chrome, service: service, options: options)

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
  if ENV['NO_HEADLESS']
    driven_by :selenium
  else
    driven_by :headless_selenium
  end

  def remove_uploaded_files
    FileUtils.rm_rf("#{Rails.root}/tmp/storage")
  end

  def before_setup
    super
    Selenium::WebDriver::Chrome::Options.new("goog:loggingPrefs": { browser: 'ALL' })
    #holocene_event = holocene_events(:holocene_event_1)
    #file = Rails.root.join('test', 'fixtures', 'files', 'image.jpg')
    ##holocene_event.image.attach(io: File.open(file), filename: 'image.jpg')
  end

  def after_teardown
    super
    #    remove_uploaded_files
    errors = page.driver.browser.logs.get(:browser)
    if errors.present?
      errors.each do |error|
        #next unless error.level == 'WARNING'
        #next unless error.message =~ /pack-test/
        next if error.message =~ /\/assets\//
        #assert_not_equal error.level, 'SEVERE', error.message
        STDERR.puts "WARN: javascript warning: #{name}"
        STDERR.puts error.message
      end
    end
  end

  # File actiontext/lib/action_text/system_test_helper.rb, line 27
  def fill_in_rich_text_area(locator = nil, with:)
    find(:xpath, "//\*[@id='#{locator}']", visible: false).set(with.to_s)
  end
end
Capybara.add_selector :rich_text_area do
  label 'rich-text area'
  xpath do |locator|
    if locator.nil?
      XPath.descendant(:"trix-editor")
    else
      input_located_by_name = XPath.anywhere(:input).where(XPath.attr(:name) == locator).attr(:id)

      XPath.descendant(:"trix-editor").where \
        XPath.attr(:id).equals(locator) |
        XPath.attr(:placeholder).equals(locator) |
        XPath.attr(:"aria-label").equals(locator) |
        XPath.attr(:input).equals(input_located_by_name)
    end
  end
end
module WaitHelpers
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end

  def wait_for_dom(_timeout = Capybara.default_max_wait_time)
    uuid = SecureRandom.uuid
    page.find('body')
    # $('body').append("<div id='#{uuid}'></div>");
    page.evaluate_script <<-EOS
      $('body').append("<div id='mergle'></div>");
    EOS
    page.find('#mergle', visible: false)
    # page.find("##{uuid}")
  end
end
include WaitHelpers
