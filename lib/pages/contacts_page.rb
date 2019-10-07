class ContactsPage
  include PageObject

  link(:new_contract, text: 'New Contract')

  # contacts/new
  text_field(:first_name, id: 'contact_first_name')
  text_field(:last_name, id: 'contact_last_name')
  text_field(:street, id: 'contact_street')
  text_field(:city, id: 'contact_city')
  text_field(:state, id: 'contact_state')
  text_field(:postal_code, id: 'contact_postal_code')
  text_field(:cell_phone, id: 'contact_cell_phone')
  text_field(:home_phone, id: 'contact_home_phone')
  text_field(:fax, id: 'contact_fax')
  text_field(:postal_code, id: 'contact_postal_code')

  text_area(:notes, id: 'contact_notes')
  button(:create_button, id: 'contact_submit')

  def create_contact(f_name, l_name)
    self.first_name = f_name
    self.last_name = l_name
  end

  # contacts/{id}
  paragraph(:status, id: 'notice')
  div(:content_div, id: 'content')
end