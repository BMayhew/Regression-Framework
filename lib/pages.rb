Dir["#{File.dirname(__FILE__)}/pages/**/*_page.rb"].each do |r|
  load r
end

def reset_app
  @browser.execute_script('sessionStorage.clear();')
end