$LOAD_PATH << File.dirname(__FILE__) + '/../lib'

require 'rspec'
require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'faker'
require 'pages'
require 'headless'

if ENV['HEADLESS']
  headless = Headless.new
  headless.start
end

if ENV['RUN_IN_DOCKER'] == 'local'
  options = Selenium::WebDriver::Chrome::Options.new
  browser = Watir::Browser.new(Selenium::WebDriver.for(:chrome, url: 'http://0.0.0.0:49337/wd/hub', options: options))
elsif ENV['RUN_IN_DOCKER'] == 'github'
  options = Selenium::WebDriver::Chrome::Options.new(args: %w[disable-dev-shm-usage no-sandbox])
  browser = Watir::Browser.new(Selenium::WebDriver.for(:chrome, url: ENV['SELENIUM_URL'], options: options))
else
  args = ['--start-maximized']
  browser = Watir::Browser.new :chrome, http_client: client, options: { args: args }
end





RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before(:all) do
    if ENV['HEADLESS']
      @headless = Headless.new(reuse: false)
      @headless.start
    end
    @browser = browser
  end
  config.after(:all) do
    @headless.destroy if ENV['HEADLESS']
  end
  config.after(:suite) { browser.close }
end
