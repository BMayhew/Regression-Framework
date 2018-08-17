class EditUserPage
  include PageObject

  page_url 'http://ec2-54-172-107-45.compute-1.amazonaws.com:3003/users/edit'

  link(:cancel_account, text: 'Cancel my account' )

  def cancel_and_confirm
    confirm(true) do
      cancel_account
    end
  end

end
