describe 'Create contact' do
  before(:all) do
    @email = Faker::Internet.email

    visit HomePage, &:my_account

    on SigninPage, &:sign_up

    on SignupPage do |page|
      page.input_user_details(
          email: @email,
          password: 'HappyBirthday1'
      )
    end

    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @street = Faker::Address.street_name
    @city = Faker::Address.city
    @state = Faker::Address.state
    @postal_code = Faker::Number.number(digits: 4)
    @cell_phone = Faker::Number.number(digits: 10)
    @parced_cell_phone = "(#{@cell_phone.to_s[0..2]}) #{@cell_phone.to_s[3..5]}-#{@cell_phone.to_s[6..10]}"
    @home_phone = Faker::Number.number(digits: 10)
    @fax = Faker::Number.number(digits: 10)
    @parced_fax = "(#{@fax.to_s[0..2]}) #{@fax.to_s[3..5]}-#{@fax.to_s[6..10]}"

    visit MyContactsPage, &:new_contact

    on CreateContactPage do |page|
      page.input_contact_details(
          first_name: @first_name,
          last_name: @last_name,
          street: @street,
          city: @city,
          state: @state,
          postal_code: @postal_code,
          cell_phone: @cell_phone,
          home_phone: @home_phone,
          fax: @fax
      )
    end

  end

  after(:all) do
    visit EditUserPage, &:cancel_and_confirm
  end

  context 'free plan' do
    it 'contact created' do
      on MyContactsPage do |page|
        expect(page.content_div).to include("#{@first_name}")
        expect(page.content_div).to include("#{@last_name}")
        expect(page.content_div).to include("#{@street}")
        expect(page.content_div).to include("#{@city}")
        expect(page.content_div).to include("#{@state}")
        expect(page.content_div).to include("#{@postal_code}")
        expect(page.content_div).to include("#{@parced_cell_phone}")
        expect(page.content_div).to include("#{@home_phone}")
        expect(page.content_div).to include("#{@parced_fax}")
      end
    end
  end
end