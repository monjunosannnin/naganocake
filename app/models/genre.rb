class Genre < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: {maximum: 20}
end
