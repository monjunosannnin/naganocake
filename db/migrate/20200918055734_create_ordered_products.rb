class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.references :order, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.integer :status, null: false, default: 0
      t.integer :price, null: false
      t.timestamps
      t.timestamps
    end
  end
end
