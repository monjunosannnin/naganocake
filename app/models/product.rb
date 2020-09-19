class Product < ApplicationRecord

  belongs_to :genre

  attachment :image

  def active_by?(product)
    active.where(product_id: product.id).exists?
  end
end
