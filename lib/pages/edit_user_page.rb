class EditUserPage
  include PageObject

  page_url 'http://ec2-54-191-181-182.us-west-2.compute.amazonaws.com/users/edit'

  link(:cancel_account, text: 'Cancel my account' )

  def cancel_and_confirm
    confirm(true) do
      cancel_account
    end
  end

end
