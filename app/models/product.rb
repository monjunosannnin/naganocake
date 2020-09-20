class Product < ApplicationRecord

  belongs_to :genre

  attachment :image_id

end
