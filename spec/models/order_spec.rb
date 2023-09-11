require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with all the valid data' do
    order = FactoryBot.create(:order)
    expect(order).to be_valid
  end

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

  it "geocodes the address" do
    order = FactoryBot.create(:order)
    expect(order.latitude).to eq(40.7127281)
    expect(order.longitude).to eq(-74.0060152)
  end

  it 'does not geocode the address if address is not valid' do
    order = FactoryBot.build(:order, address: nil) # Create an order with a blank address
    expect(order).not_to receive(:geocode) # Expect that geocode won't be called
    order.save
  end
end
