require 'selenium-webdriver'
require 'capybara/rspec'

Capybara.configure do |config|

  config.default_driver = :selenium_chrome_headless
  config.javascript_driver = :selenium_chrome_headless
  config.run_server = true
  config.default_selector = :css
  config.default_max_wait_time = 5
  config.ignore_hidden_elements = true
  config.save_path = Dir.pwd
  config.automatic_label_click = false
end

Capybara.register_driver :selenium_chrome_headless do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new


  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1400,1400')


  #driver = 
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome_headless
