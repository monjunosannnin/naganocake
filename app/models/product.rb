class Product < ApplicationRecord
  def active_by?(product)
    active.where(product_id: product.id).exists?
  end
end
