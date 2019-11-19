describe 'Adding a contact' do
  context 'with a logged in user' do
    before(:all) do
      @email = Faker::Internet.email

      visit HomePage, &:my_account

      on SigninPage, &:sign_up

      on SignupPage do |page|
        page.input_user_details(
            email: @email,
            password: 'HappyBirthday1'
        )
        page.home
      end

      on HomePage do |page|
        page.my_contacts
      end

      on ContactsPage do |page|
        page.new_contract
        page.create_contact('Butch', 'Mayhew')
        page.create_button
      end

    end

    it 'has valid information' do
      on ContactsPage do |page|
        expect(page.status).to include('Contact was successfully updated.')
        expect(page.content_div).to include('First name: Butch')
        expect(page.content_div).to include('Last name: Mayhew')
      end
    end
  end
end