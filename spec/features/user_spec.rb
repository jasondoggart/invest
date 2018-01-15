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
            expect(current_path).to eq(user_path(user))
            expect(page).to have_content('logout')

        end

    end

    describe 'registered user actions' do

        before do
            @first_name = "firstName"
            @last_name = "lastName"
            @email = "user@example.com"
            @password = "password"

            @user = User.create(first_name: @first_name, last_name: @last_name, email: @email, password: @password, password_confirmation: @password)
        end

        it 'can sign in with proper credentials' do
            visit new_user_session_path

            fill_in 'user[email]', with: @email
            fill_in 'user[password]', with: @password
            click_on 'Log in'

            expect(current_path).to eq(user_path(@user))


        end

        it 'can logout after loggin in' do
            login_as(@user, :scope => :user)
            visit user_path(@user)
            click_on 'logout'
            expect(current_path).to eq(root_path)
        end

        xit 'can update their information after loggin in' do
            @new_first = "newFirstName"
            @new_last = "newLastName"
            @new_email = "newEmail@example.com"
            
            login_as(@user, :scope => :user)
            visit edit_user_registration_path

            fill_in 'user[first_name]', with: @new_first
            fill_in 'user[last_name]', with: @new_last
            fill_in 'user[email]', with: @new_email
            fill_in 'user[current_password]', with: @password

            click_on 'Update'
            byebug
            expect(current_path).to eq(user_path(@user))

            expect(@user.first_name).to eq(@new_first)
            expect(@user.last_name).to eq(@new_last)
            expect(@user.email).to eq(@new_email)

        end

    end

end