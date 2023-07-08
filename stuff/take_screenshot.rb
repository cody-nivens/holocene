require "selenium-webdriver"

# configure the driver to run in headless mode
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :selenium, options: options

# navigate to a really super awesome blog
driver.navigate.to "http://locahost:3000/"

# resize the window and take a screenshot
driver.manage.window.resize_to(800, 800)
driver.save_screenshot "intoli-screenshot.png"
