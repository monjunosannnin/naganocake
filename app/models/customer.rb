class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :kanji_familyname, :kanji_firstname, :kana_familyname, :kana_firstname, :postal_code, :address, :telephone_number, :email, :encrypted_password, presence: true
  
  has_many :orders, foreign_key: 'customer_id', dependent: :destroy
  has_many :cart_items, foreign_key: 'customer_id', dependent: :destroy
  has_many :deliveries, foreign_key: 'customer_id', dependent: :destroy

  def full_address
    self.postal_code + self.address + self.kanji_familyname + self.kanji_firstname
  end
end
