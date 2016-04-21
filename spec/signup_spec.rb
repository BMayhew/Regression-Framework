describe 'Create account' do
  context 'free plan' do
    before(:all) do
      @email = Faker::Internet.email
      
      visit HomePage do |page|
        page.my_account
      end

      on SigninPage do |page|
        page.sign_up
      end

      on SignupPage do |page|
        page.input_user_details(
          email: @email,
          password: 'Daxko123!'
        )
        page.home
      end
    end

     after(:all) do
       visit EditUserPage do |page|
         page.cancel_and_confirm
       end
     end

     it 'currently signed in' do
        on HomePage do |page|
          expect(page.content_div).to include("Currently sign in as #{@email}")
        end
     end

  end
end
