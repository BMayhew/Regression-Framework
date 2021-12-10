class HomePage
  include PageObject

  page_url 'http://159.223.145.12:3000/'

  link(:my_account, text: 'My Account')
  div(:content_div, id: 'content')
end
