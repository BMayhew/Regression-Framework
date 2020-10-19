class HomePage
  include PageObject

  page_url 'https://www.saucedemo.com/'

  text_field(:username, id: 'user-name')
  text_field(:password, id: 'password')
  button(:login_button, id: 'login-button')


  def login(params = {})
    self.username = params[:username] || 'standard_user'
    self.password = params[:password] || 'secret_sauce'
    login_button
  end
end
