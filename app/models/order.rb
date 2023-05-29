class Order < ApplicationRecord
  belongs_to :toy
  belongs_to :user
end
