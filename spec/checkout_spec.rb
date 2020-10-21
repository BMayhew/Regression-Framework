describe 'Checkout with an item in cart' do
  context 'as a standard user' do
    before(:all) do
      @user_name = 'standard_user'
      @password = 'secret_sauce'
      @item_name = 'Sauce Labs Backpack'
      @description = 'carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.'
      @price = '29.99'
      @first_name = 'Testy'
      @last_name = ' Mctester'
      @postal_code = 12345

      visit HomePage do |page|
        page.login(username: @user_name, password: @password)
      end
    end

    after(:all) do
      reset_app
      visit LogoutPage
    end

    it 'checkout successful' do
      on InventoryPage do |page|
        page.find_item_button(@item_name).click
        expect(page.find_item_button(@item_name).text).to include('REMOVE')
        expect(page.shopping_cart_count).to include('1')
        page.shopping_cart
      end

      on CartPage do |page|
        expect(page.find_cart_item(@item_name).text).to include(@price)
        page.checkout
      end

      on CheckoutStepOnePage do |page|
        page.first_name = @first_name
        page.last_name = @last_name
        page.postal_code = @postal_code
        page.continue
      end

      on CheckoutStepTwoPage do |page|
        page.finish
      end

      on CheckoutCompletePage do |page|
        expect(page.complete_container).to include('THANK YOU FOR YOUR ORDER')
      end
    end
  end
end
