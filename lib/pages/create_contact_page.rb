class CreateContactPage
  include PageObject

  page_url 'http://134.122.124.216:3000/contacts/new'

  text_field(:first_name, id: 'contact_first_name')
  text_field(:last_name, id: 'contact_last_name')
  text_field(:street, id: 'contact_street')
  text_field(:city, id: 'contact_city')
  text_field(:state, id: 'contact_state')
  text_field(:postal_code, id: 'contact_postal_code')
  text_field(:cell_phone, id: 'contact_cell_phone')
  text_field(:home_phone, id: 'contact_home_phone')
  text_field(:fax, id: 'contact_fax')
  text_field(:notes, id: 'contact_notes')
  button(:contact_submit, id: 'contact_submit')

  def input_contact_details(params = {})
    self.first_name = params[:first_name] || Faker::Name.first_name
    self.last_name = params[:last_name] || Faker::Name.last_name
    self.street = params[:street] || Faker::Address.street_name
    self.city = params[:city] || Faker::Address.city
    self.state = params[:state] || Faker::Address.state
    self.postal_code_element.click
    @browser.send_keys params[:postal_code] || Faker::Number.number(digits: 4)
    self.cell_phone_element.click
    @browser.send_keys params[:cell_phone] || Faker::Number.number(digits: 10)
    self.home_phone_element.click
    @browser.send_keys params[:home_phone] || Faker::Number.number(digits: 10)
    self.fax_element.click
    @browser.send_keys params[:fax] || Faker::Number.number(digits: 10)

    contact_submit
  end
end
