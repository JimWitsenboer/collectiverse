class Order < ApplicationRecord
  validates :address, :city, :state, :country, presence: true
  # validates :card_number, presence: true, numericality: { only_integer: true }
  # validates :exp_month, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  # validates :exp_year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: Date.today.year, less_than_or_equal_to: Date.today.year + 10 }
  # validates :card_code, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999 }
  belongs_to :toy
  belongs_to :buyer, class_name: "User"
  # belongs_to :seller, class_name: "User", through: :toy
  belongs_to :user
end
