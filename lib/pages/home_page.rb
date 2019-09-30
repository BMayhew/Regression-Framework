class HomePage
  include PageObject

  page_url 'http://209.97.151.77:3000'

  link(:my_account, text: 'My Account')
  div(:content_div, id: 'content')

end