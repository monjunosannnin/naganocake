class Genre < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
  has_many :products
end
