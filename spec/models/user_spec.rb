require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Valid data test' do
    it 'is valid with all the valid data' do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it 'has many toys with dependent destroy' do
      user = create(:user)
      toy1 = create(:toy, user: user)
      toy2 = create(:toy, user: user)
      expect(user.toys.count).to eq(2)
      user.destroy
      expect { toy1.reload }.to raise_error(ActiveRecord::RecordNotFound)
      expect { toy2.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'Invalid data tests' do
    it 'is invalid without an first name' do
      user = FactoryBot.build(:user, first_name: nil)
      expect(user).not_to be_valid
    end

    it 'is invalid without an last name' do
      user = FactoryBot.build(:user, last_name: nil)
      expect(user).not_to be_valid
    end

    it 'is invalid without an username' do
      user = FactoryBot.build(:user, username: nil)
      expect(user).not_to be_valid
    end

    it 'is invalid without an email' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'is invalid without a password' do
      user = FactoryBot.build(:user, password: nil)
      expect(user).not_to be_valid
    end

    it 'is invalid without a password confirmation' do
      user = FactoryBot.build(:user, password_confirmation: '')
      expect(user).not_to be_valid
    end

    it 'is invalid when password confirmation is not the same as password' do
      user = FactoryBot.build(:user, password_confirmation: 'different_from_password')
      expect(user).not_to be_valid
    end
  end
end
