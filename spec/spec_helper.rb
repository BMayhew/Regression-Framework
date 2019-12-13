$LOAD_PATH << File.dirname(__FILE__) + '/../lib'

require 'rspec'
require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'faker'
require 'pages'

if ENV['HEADLESS']
  puts 'Running in headless mode'
  browser = Watir::Browser.new :chrome, switches: %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless --no-sandbox --disable-dev-shm-usage]
  browser.driver.manage.timeouts.implicit_wait = 10 # seconds
else
  puts 'Running in non-headless mode'
  browser = Watir::Browser.new :chrome
end

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before(:all) { @browser = browser }
  config.after(:suite) { browser.close }
end
