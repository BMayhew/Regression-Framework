class HomePage
  include PageObject

  page_url 'http://68.183.97.242:3000/'

  link(:my_account, text: 'My Account')
  div(:content_div, id: 'content')
end
