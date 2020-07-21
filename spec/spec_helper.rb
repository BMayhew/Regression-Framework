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

# Class -> method
Helper.go_to_google


RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before(:all) do
    @browser = browser
  end

  config.after(:suite) do
    browser.close
    # This looks like a good place for a cancel account/logout method
  end
end


