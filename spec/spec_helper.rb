$LOAD_PATH << File.dirname(__FILE__) + '/../lib'

require 'rspec'
require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'faker'
require 'pages'

browser = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless --no-sandbox --disable-dev-shm-usage]
browser.driver.manage.timeouts.implicit_wait = 100 # seconds
browser.window.maximize

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before(:all) { @browser = browser }
  config.after(:suite) { browser.close }
end
