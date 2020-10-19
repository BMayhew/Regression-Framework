class InventoryPage
	include PageObject
	
	page_url = 'https://www.saucedemo.com/inventory.html'

	div(:inventory_div, id: 'inventory_container')
end