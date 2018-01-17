require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  before do
    @user = User.create(first_name: "Jason", last_name: "Doggart", email: "test@test.com", password: "password", password_confirmation: "password")
    @portfolio = Portfolio.create(name: "RRSP", account_type: "RRSP", description: "Retirement savings account", user: @user)
  end

  it 'can be created with valid parameters' do
    expect(@portfolio).to be_valid
  end

  it 'cannot be created without a valid name' do
    @portfolio.name = ''
    expect(@portfolio).to_not be_valid
  end

  it 'cannot be created without a valid type' do
    @portfolio.account_type = ''
    expect(@portfolio).to_not be_valid
  end

  it 'cannot be created without a valid description' do
    @portfolio.description = ''
    expect(@portfolio).to_not be_valid
  end

  it 'cannot be created with a user' do
    @portfolio.user = nil
    expect(@portfolio).to_not be_valid
  end
end
