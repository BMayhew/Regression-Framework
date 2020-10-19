describe 'Login' do
  context 'as a standard user' do
    before(:all) do
      @user_name = 'standard_user'
      @password = 'secret_sauce'

      visit HomePage do |page|
        # page.username = @user_name
        # page.password = @password
        # page.login_button
        page.login
      end
    end

    after(:all) do
      visit LogoutPage
    end

    it 'displays product screen' do
      on InventoryPage do |page|
        expect(page.inventory_div).to include("Sauce Labs Backpack")
      end
    end
  end
end
