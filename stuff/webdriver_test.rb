require 'rubygems'
require 'selenium-webdriver'
# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
caps['device'] = 'iPhone 11'
caps['realMobile'] = 'true'
caps['os_version'] = '14.0'
caps['javascriptEnabled'] = 'true'
caps['name'] = 'BStack-[Ruby] Sample Test' # test name
caps['build'] = 'BStack Build Number 1' # CI/CD job or build name
options = Selenium::WebDriver::Chrome::Options.new
    options.add_preference(:capabilities, caps)

caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w[--headless --disable-gpu] },
      'goog:loggingPrefs': {
          browser: 'ALL'
      }
    )

driver = Selenium::WebDriver.for(:remote,
  :url => "http://localhost:3000",
  :capabilities => caps)
# Searching for 'BrowserStack' on google.com
driver.navigate.to "http://www.google.com"
element = driver.find_element(:name, "q")
element.send_keys "BrowserStack"
element.submit
wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
begin
  wait.until { !driver.title.match(/BrowserStack/i).nil? }
  driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "Yaay! Title matched!"}}')
rescue
  driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed", "reason": "Oops! Title did not match"}}')
end
driver.quit
