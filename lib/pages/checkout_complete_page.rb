class CheckoutCompletePage
  include PageObject

  page_url 'https://www.saucedemo.com/checkout-complete.html'

  h2(:complete_header, class: 'complete-header')
  div(:complete_container, id: 'checkout_complete_container')
end
