class CheckoutStepOnePage
  include PageObject

  page_url 'https://www.saucedemo.com/cart.html'

  text_field(:first_name, data_test: 'firstName')
  text_field(:last_name, data_test: 'lastName')
  text_field(:postal_code, data_test: 'postalCode')

  button(:continue, value: 'CONTINUE' )


end
