class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :kanji_familyname, null: false
      t.string :kanji_firstname, null: false
      t.string :kana_familyname, null: false
      t.string :kana_firstname, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :telephone_number, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.boolean :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end
