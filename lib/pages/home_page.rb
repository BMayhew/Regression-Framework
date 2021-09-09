class HomePage
  include PageObject

  page_url 'http://67.205.174.150:3000/'

  link(:my_account, text: 'My Account')
  div(:content_div, id: 'content')
end
