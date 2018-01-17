require 'rails_helper'

describe 'portfolio navigation' do

    describe 'portfolio creation' do

        before do
            @user = User.create(first_name: "Jason", last_name: "Doggart", email: "test@test.com", password: "password", password_confirmation: "password")
            login_as(@user, :scope => :user)
        end

        it 'can be created' do
            portfolio_name = "newPortfolio"
            portfolio_type = "portfolioType"
            portfolio_desc = "portfolioDescription"

            visit user_path(@user)
            click_on "Add new portfolio"
            expect(current_path).to eq(new_portfolio_path)

            fill_in 'portfolio[name]', with: portfolio_name
            fill_in 'portfolio[account_type]', with: portfolio_type
            fill_in 'portfolio[description]', with: portfolio_desc
            click_on "Create portfolio"
            expect(current_path).to eq(user_path(@user))
        end
    end
end