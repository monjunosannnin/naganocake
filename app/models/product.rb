class Product < ApplicationRecord
    has_many :ordered_products, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    belongs_to :genre
    attachment :image

end
