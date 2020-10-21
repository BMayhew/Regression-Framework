describe 'Add Item to Cart' do
  context 'as a standard user' do
    before(:all) do
      @user_name = 'standard_user'
      @password = 'secret_sauce'
      @item_name = 'Sauce Labs Backpack'
      @description = 'carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.'
      @price = '29.99'

      visit HomePage do |page|
        page.login(username: @user_name, password: @password)
      end
    end

    after(:all) do
      reset_app
      visit LogoutPage
    end

    it 'add item to cart from inventory page' do
      on InventoryPage do |page|
        page.find_item_button(@item_name).click
        expect(page.find_item_button(@item_name).text).to include('REMOVE')
        expect(page.shopping_cart_count).to include('1')
        page.shopping_cart
      end

      on CartPage do |page|
        expect(page.find_cart_item(@item_name).text).to include(@description)
        expect(page.find_cart_item(@item_name).text).to include(@price)
      end
    end
  end
end
