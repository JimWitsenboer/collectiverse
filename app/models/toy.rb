class Toy < ApplicationRecord
  has_one_attached :photo
  searchkick
  scope :similar_toys, ->(toy) { where("id != ?", toy.id) }
  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  belongs_to :user
  has_many :orders
end
