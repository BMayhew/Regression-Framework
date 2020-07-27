describe 'Create account' do
  context 'free plan' do
    before(:all) do
      Helper.cancel_account
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
    end

    after(:all) do
      visit EditUserPage, &:cancel_and_confirm
      Helper.create_account
    end

    it 'currently signed in' do
      on HomePage do |page|
        expect(page.content_div).to include("Currently sign in as #{@email}")
      end
    end
  end
end
