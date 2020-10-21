describe 'Login' do
  context 'as a standard user' do
    before(:all) do
      @user_name = 'standard_user'
      @password = 'secret_sauce'

      visit HomePage do |page|
        page.login(username: @user_name, password: @password)
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

  context 'as a locked out user' do
    before(:all) do
      @user_name = 'locked_out_user'
      @password = 'secret_sauce'

      visit HomePage do |page|
        page.login(username: @user_name, password: @password)
      end
    end

    after(:all) do
      visit LogoutPage
    end

    it 'displays product screen' do
      on HomePage do |page|
        expect(page.error_message).to include('Epic sadface: Sorry, this user has been locked out.')
      end
    end
  end

  context 'as a problem user' do
    before(:all) do
      @user_name = 'problem_user'
      @password = 'secret_sauce'

      visit HomePage do |page|
        page.login(username: @user_name, password: @password)
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
  context 'as a problem glitch user' do
    before(:all) do
      @user_name = 'performance_glitch_user'
      @password = 'secret_sauce'

      visit HomePage do |page|
        page.login(username: @user_name, password: @password)
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
