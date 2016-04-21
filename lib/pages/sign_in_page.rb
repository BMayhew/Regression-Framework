class SigninPage
  include PageObject

  link(:sign_up, text: 'Sign up')
  link(:forgot_password, text: 'Forgot your password?')
  text_field(:email, id: 'user_email')
  text_field(:password, id: 'user_password')
  button(:submit, id: 'user_submit')
  div(:error_message, class: 'form-error-main')

  def login(params = {})
  	email_element.when_present
    email = params[:email] || 'bmayhew@daxko.com'
    password = params[:password] || 'Blue4242'
    submit
  end
end