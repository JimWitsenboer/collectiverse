class Toy < ApplicationRecord
  # has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "default.jpg"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_one_attached :photo

  validates :name, :description, :price, presence: true
  validates :price, numericality: {greater_than: 0}
  # validate presence of attachment, something like this: 'validates_attachment_presence :image'

  belongs_to :user

  has_many :orders
end
