require 'rails_helper'

describe 'user navigation' do

    describe 'user creation' do

        it 'can register with full set of user attributes' do
            visit new_user_registration_path

            email = 'test@test.com'
            password = 'password'
            first_name = 'Test'
            last_name = 'User'

            fill_in 'user[email]', with: email
            fill_in 'user[password]', with: password
            fill_in 'user[password_confirmation]', with: password
            fill_in 'user[first_name]', with: first_name
            fill_in 'user[last_name]', with: last_name

            click_on 'Sign up'

            user = User.last

            expect(user.email).to eq(email)
            expect(user.first_name).to eq(first_name)
            expect(user.last_name).to eq(last_name)


            expect(page).to have_content('Welcome')

        end

    end

end