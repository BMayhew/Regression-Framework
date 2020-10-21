class CartPage
  include PageObject

  page_url 'https://www.saucedemo.com/cart.html'

  div(:cart_item, class: 'cart_item')
  link(:checkout, class: 'checkout_button')

  def reset_sidebar_link
    @browser.link(id: 'reset_sidebar_link').click!
  end

  def find_cart_item(item_name)
    @browser.div(class: 'cart_item').
        div(class: 'inventory_item_name', text: item_name).parent.parent.parent
  end
end
