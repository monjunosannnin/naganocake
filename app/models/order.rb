class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products, foreign_key: 'order_id', dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :billing_amount, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  enum payment_method: {
    クレジットカード: 0,
    銀行振込: 1
  }

  enum status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済み: 4
  }
end
