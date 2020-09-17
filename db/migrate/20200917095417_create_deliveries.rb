class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
	t.references :customer, foreign_key: true, null: false
	t.string :address, null: false
	t.string :postal_code, null: false
	t.string :name, null: false
	t.timestamps
    end
  end
end
