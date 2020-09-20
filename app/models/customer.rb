class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :orders, foreign_key: 'customer_id', dependent: :destory
  has_many :cart_items, dependent: :destroy
  has_many :deliveries, dependent: :destroy
end
