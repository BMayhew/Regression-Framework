class EditUserPage
  include PageObject

  page_url 'http://161.35.207.122:3000/users/edit'

  link(:cancel_account, text: 'Cancel my account')

  def cancel_and_confirm
    confirm(true) do
      cancel_account
    end
  end
end
