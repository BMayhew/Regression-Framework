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

client = Selenium::WebDriver::Remote::Http::Default.new
args = ['--no-sandbox --disable-dev-shm-usage --headless']
browser = Watir::Browser.new :chrome, http_client: client, options: { args: args }

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
