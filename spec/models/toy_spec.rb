require 'rails_helper'

RSpec.describe Toy, type: :model do
  describe 'Valid data test' do
    it 'is valid with all the valid data' do
      toy = FactoryBot.create(:toy)
      expect(toy).to be_valid
    end

    it 'can have one attached photo' do
      toy = FactoryBot.create(:toy)
      toy.photo.attach(io: File.open(Rails.root.join('app', 'assets', './images/banner.png')), filename: 'banner.png', content_type: 'image/jpeg')
      expect(toy.photo).to be_attached
    end
  end

  describe 'Invalid data tests' do
    it 'is invalid without a name' do
      toy = FactoryBot.build(:toy, name: nil)
      expect(toy).not_to be_valid
    end

    it 'is invalid without a description' do
      toy = FactoryBot.build(:toy, description: nil)
      expect(toy).not_to be_valid
    end

    it 'is invalid without a price' do
      toy = FactoryBot.build(:toy, price: nil)
      expect(toy).not_to be_valid
    end

    it 'is invalid with price below zero' do
      toy = FactoryBot.build(:toy, price: -2)
      expect(toy).not_to be_valid
    end

    it 'is invalid with string as price' do
      toy = FactoryBot.build(:toy, price: 'price')
      expect(toy).not_to be_valid
    end
  end
end
