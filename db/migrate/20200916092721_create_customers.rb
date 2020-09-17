class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :kanji_familyname
      t.string :kanji_firstname
      t.string :kana_familyname
      t.string :kana_firstname
      t.string :postal_code
      t.string :address
      t.string :telephone_number
      t.string :email
      t.string :encrypted_password
      t.boolean :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end
