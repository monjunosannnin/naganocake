class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :genre_id, foreign_key: true, null: false
      t.string :name, index: true
      t.text :explanation
      t.string :image_id
      t.integer :price
      t.boolean :is_active, null: true
      t.timestamps
    end
  end
end
