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

        it 'cannot be created if user is not signed in' do
            logout(:user)
            visit new_portfolio_path
            expect(current_path).to eq(new_user_session_path)
        end

    end

    describe 'portfolio update' do
        before do
            portfolio_name = "My portfolio"
            portfolio_account_type = "RRSP"
            portfolio_desc = "Retirement savings"

            @user = User.create(first_name: "Jason", last_name: "Doggart", email: "test@test.com", password: "password", password_confirmation: "password")
            login_as(@user, :scope => :user)
            @portfolio = Portfolio.create(name: portfolio_name, description: portfolio_desc, account_type: portfolio_account_type, user: @user)
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

    describe 'portfolio deletion' do
        before do
            portfolio_name = "My portfolio"
            portfolio_account_type = "RRSP"
            portfolio_desc = "Retirement savings"

            @user = User.create(first_name: "Jason", last_name: "Doggart", email: "test@test.com", password: "password", password_confirmation: "password")
            login_as(@user, :scope => :user)
            @portfolio = Portfolio.create(name: portfolio_name, description: portfolio_desc, account_type: portfolio_account_type, user: @user)
        end

        it 'can be deleted by a logged in user' do
            
        end
    end

    describe 'portfolio actions' do
        before do
            portfolio_name = "My portfolio"
            portfolio_account_type = "RRSP"
            portfolio_desc = "Retirement savings"

            @user = User.create(first_name: "Jason", last_name: "Doggart", email: "test@test.com", password: "password", password_confirmation: "password")
            login_as(@user, :scope => :user)
            @portfolio = Portfolio.create(name: portfolio_name, description: portfolio_desc, account_type: portfolio_account_type, user: @user)
            @portfolio1 = Portfolio.create(name: "Portfolio 1", description: "1st Portfolio", account_type: "RRSP1", user: @user)
            @portfolio2 = Portfolio.create(name: "Portfolio 2", description: "2nd Portfolio", account_type: "RRSP2", user: @user)
            @portfolio3 = Portfolio.create(name: "Portfolio 3", description: "3rd Portfolio", account_type: "RRSP3", user: @user)
            @portfolio4 = Portfolio.create(name: "Portfolio 4", description: "4th Portfolio", account_type: "RRSP4", user: @user)
            @portfolio5 = Portfolio.create(name: "Portfolio 5", description: "5th Portfolio", account_type: "RRSP5", user: @user)
        end

        it 'can access a list of all of the portfolios created by the user' do
            visit portfolios_path
        end

        it 'can view the details of a single portfolio' do
            visit portfolio_path(@portfolio)
        end
    end
end