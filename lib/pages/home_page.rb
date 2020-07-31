class HomePage
  include PageObject

  page_url 'http://134.122.124.216:3000/'

  link(:my_account, text: 'My Account')
  div(:content_div, id: 'content')
end
