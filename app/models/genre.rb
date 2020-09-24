class Genre < ApplicationRecord
  has_many :products, foreign_key: 'genre_id', dependent: :destroy

  validates :name, presence: true, length: {maximum: 20}
end
