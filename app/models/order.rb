class Order < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :address, presence: true # :state, :country
  belongs_to :toy
  belongs_to :user
end
