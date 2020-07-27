$LOAD_PATH << File.dirname(__FILE__) + '/../lib'

require 'rspec'
require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'faker'
require 'pages'

require_relative '../lib/helper.rb'

browser = Watir::Browser.new :chrome

$browser = browser

Helper.create_account

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before(:all) do
    @browser = browser
  end

  config.after(:suite) do
    Helper.cancel_account
    browser.close
  end
end
