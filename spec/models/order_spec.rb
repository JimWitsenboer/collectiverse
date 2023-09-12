require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Valid data test' do
    it 'is valid with all the valid data' do
      order = FactoryBot.create(:order)
      expect(order).to be_valid
    end
  end

  describe 'Invalid data tests' do
    it 'is invalid without an address' do
      order = FactoryBot.build(:order, address: nil)
      expect(order).not_to be_valid
    end

    it 'is invalid without an user' do
      order = FactoryBot.build(:order, user: nil)
      expect(order).not_to be_valid
    end

    it 'is invalid without a toy' do
      order = FactoryBot.build(:order, toy: nil)
      expect(order).not_to be_valid
    end
  end

  describe 'Geocode tests' do
    it "geocodes the address when data is valid" do
      order = FactoryBot.create(:order)
      expect(order.latitude).to eq(40.7127281)
      expect(order.longitude).to eq(-74.0060152)
    end

    it 'does not geocode the address when address is not valid' do
      order = FactoryBot.build(:order, address: nil)
      expect(order).not_to receive(:geocode)
      order.save
    end
  end
end
