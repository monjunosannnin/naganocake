class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :genre, foreign_key: true, null: false
      t.string :name, null: false, index: true
      t.text :explanation, null: false
      t.string :image_id, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
