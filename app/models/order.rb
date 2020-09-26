class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products, foreign_key: 'order_id', dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :billing_amount, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def ordered_products_status_change(opm)
    opd = self.ordered_products

    if opm.values[0] == "入金待ち"
      opd.each do |op|
        op.update(status: "製作不可")
      end
    elsif opm.values[0] != "入金待ち"
      if opd.where.not(status: "製作不可").count == 0
        opd.each do |op|
          op.update(status: "製作待ち")
        end
      end
    end
  end

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
