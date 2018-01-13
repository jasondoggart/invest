require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = User.create(first_name: "Jason", last_name: "Doggart", email: "test@test.com", password: "password", password_confirmation: "password")
    end

    it 'should be created with valid input' do
      expect(@user).to be_valid
    end

    it 'should not be valid with no email address' do
      @user.email = ''
      expect(@user).to_not be_valid
    end

    it 'should not be valid with no first name' do
      @user.first_name = ''
      expect(@user).to_not be_valid
    end

    it 'should not be valid with no last name' do
      @user.last_name = ''
      expect(@user).to_not be_valid
    end
  end

end
