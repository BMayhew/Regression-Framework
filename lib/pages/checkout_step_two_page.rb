class CheckoutStepTwoPage
  include PageObject

  page_url 'https://www.saucedemo.com/checkout-step-two.html'

  div(:sub_total, class: 'summary_subtotal_label')
  div(:tax, class: 'summary_tax_label')
  div(:total, class: 'summary_total_label')
  link(:finish, class: 'cart_button' )
end
