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

        #test that cannot be created when no user logged in
    end

    describe 'portfolio update' do
        before do
            @user = User.create(first_name: "Jason", last_name: "Doggart", email: "test@test.com", password: "password", password_confirmation: "password")
            login_as(@user, :scope => :user)
            @portfolio = Portfolio.create(name: "My portfolio", description: "Retirement Savings", account_type: "RRSP", user: @user)
        end
        it 'can be updated with valid parameters' do
            visit edit_portfolio_path(@portfolio)

            new_name = "My updated name"
            new_desc = "My updated description"
            new_account_type = "My updated account type"

            fill_in 'portfolio[name]', with: new_name
            fill_in 'portfolio[account_type]', with: new_account_type
            fill_in 'portfolio[description]', with: new_desc
            click_on "Update portfolio"
            expect(@portfolio.reload.name).to eq(new_name)
            expect(@portfolio.account_type).to eq(new_account_type)
            expect(@portfolio.description).to eq(new_desc)
            expect(current_path).to eq(user_path(@user))

        end
    end
end