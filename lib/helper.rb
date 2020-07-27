require 'watir'
class Helper

	def self.cancel_account
		$browser.goto 'http://134.122.124.216:3000/users/edit'
		$browser.execute_script('window.confirm = function() {return true}')
		$browser.a(text: 'Cancel my account').click
	end

	def self.create_account
		$browser.goto 'http://134.122.124.216:3000/users/sign_up'
		$browser.text_field(id: 'user_email').set 'testymctester@test.com'
		$browser.text_field(id: 'user_password').set 'HappyBirthday1'
		$browser.text_field(id: 'user_password_confirmation').set 'HappyBirthday1'
		$browser.button(id: 'user_submit').click
	end

	def self.create_contact
		$browser.goto 'http://134.122.124.216:3000/contacts'
		$browser.a(text: 'New Contract').click
		$browser.text_field(id: 'contact_first_name').set Faker::Name.first_name
		$browser.text_field(id: 'contact_last_name').set Faker::Name.last_name
		$browser.text_field(id: 'contact_street').set Faker::Address.street_name
		$browser.text_field(id: 'contact_city').set Faker::Address.city
		$browser.text_field(id: 'contact_state').set Faker::Address.state
		$browser.text_field(id: 'contact_postal_code').set Faker::Number.number(digits: 4)
		$browser.text_field(id: 'contact_cell_phone').set Faker::Number.number(digits: 10)
		$browser.text_field(id: 'contact_home_phone').set Faker::Number.number(digits: 10)
		$browser.text_field(id: 'contact_fax').set Faker::Number.number(digits: 10)
		$browser.text_field(id: 'contact_notes').set 'Random String!'
		$browser.a(text: 'Create Contact').click
	end
end
