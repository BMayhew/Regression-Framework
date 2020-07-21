class MyContactsPage
  include PageObject

  page_url 'http://134.122.124.216:3000/contacts'

  link(:new_contact, text: 'New Contract')
  div(:content_div, class: 'left')
end
