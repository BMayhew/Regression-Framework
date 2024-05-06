class HomePage
  include PageObject

  page_url 'http://137.184.139.114:3000/'

  link(:my_account, text: 'My Account')
  div(:content_div, id: 'content')
end
