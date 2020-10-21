class InventoryPage
	include PageObject
	
	page_url = 'https://www.saucedemo.com/inventory.html'

	button(:burger_button, text: 'Open Menu')

	div(:inventory_div, id: 'inventory_container')
  div(:first_item, id: 'inventory_item', text: 'Sauce Labs Backpack')
  span(:shopping_cart_count, class: 'shopping_cart_badge')
  link(:shopping_cart, class: 'shopping_cart_link')


	def find_item_button(item_name)
		@browser.div(class: 'inventory_item').div(class: 'inventory_item_label').
				div(class: 'inventory_item_name', text: item_name).parent.parent.parent.
				button(class: 'btn_inventory')
	end
end