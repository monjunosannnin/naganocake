class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true, null: false
      t.integer :payment_method, null: false
      t.integer :billing_amount, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_cost, null: false, default: 800
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
