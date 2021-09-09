class EditUserPage
  include PageObject

  page_url 'http://67.205.174.150:3000/users/edit'

  link(:cancel_account, text: 'Cancel my account')

  def cancel_and_confirm
    confirm(true) do
      cancel_account
    end
  end
end
