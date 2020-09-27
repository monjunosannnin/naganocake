class OrderedProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def ordered_product_update_check(opp)
    order = self.order

    if order.status != "入金待ち" && opp.values[0] != "製作不可"
      self.update(opp)

      if order.ordered_products.where.not(status: "製作完了").count == 0
        order.update(status: "発送準備中")
      end
    end
  end

  enum status: {
    製作不可: 0,
    製作待ち: 1,
    製作中: 2,
    製作完了: 3,
  }
end
