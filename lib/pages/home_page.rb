class HomePage
  include PageObject

  page_url 'http://161.35.207.122:3000/'

  link(:my_account, text: 'My Account')
  div(:content_div, id: 'content')
end
