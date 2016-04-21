class SignupPage
  include PageObject


  link(:home, href: '/')

  text_field(:email, id: 'user_email')
  text_field(:password, id: 'user_password')
  text_field(:password_confirmation, id: 'user_password_confirmation')
  button(:submit, id: 'user_submit')

  def input_user_details(params = {})
    email_element.when_present
    self.email = params[:email] || Faker::Internet.email
    self.password = params[:password] || 'Daxko123!'
    self.password_confirmation = params[:password] || 'Daxko123!'
    self.submit
  end
end
