# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
	email: 'test_admin@gmail.com',
	password: 'testadmin'
)

Customer.create!(
  kanji_familyname: '北垣',
  kanji_firstname: '健介',
  kana_familyname: 'キタガキ',
  kana_firstname: 'ケンスケ',
  email: 'test_customer@gmail.com',
  password: 'testcustomer',
  telephone_number: '00000000000',
  postal_code: '1000003',
  address: '東京都千代田区一ツ橋',
  is_deleted: false
)

Genre.create!(
  name: 'プリン',
  is_active: true
)

Order.create!(
  customer_id: Customer.find(1).id,
  payment_method: 0,
  billing_amount: 1900,
  name: '北垣健介',
  postal_code: '1000002',
  address: '東京都千代田区皇居外縁',
  shipping_cost: 800,
  status: 0
)

Delivery.create!(
  customer_id: Customer.find(1).id,
  name: '北垣健介',
  postal_code: '1000002',
  address: '東京都千代田区皇居外縁'
)

Product.create!(
  genre_id: Genre.find(1).id,
  name: "パフェ",
  explanation: "美味しいです",
  image_id: File.open('./app/assets/images/test.jpg'),
  price: 1000,
  is_active: true
)

OrderedProduct.create!(
  order_id: Order.find(1).id,
  product_id: Product.find(1).id,
  quantity: 1,
  status: 0,
  price: 1100
)

CartItem.create!(
  customer_id: Customer.find(1).id,
  product_id: Product.find(1).id,
  quantity: 5
)

Admin.create!(
	email: 'test_admin2@gmail.com',
	password: 'testadmin2'
)

Customer.create!(
  kanji_familyname: '武田',
  kanji_firstname: '要',
  kana_familyname: 'タケダ',
  kana_firstname: 'カナメ',
  email: 'test_customer2@gmail.com',
  password: 'testcustomer2',
  telephone_number: '00000000001',
  postal_code: '1000005',
  address: '東京都千代田区丸の内',
  is_deleted: false
)

Genre.create!(
  name: 'ケーキ',
  is_active: true
)

Order.create!(
  customer_id: Customer.find(2).id,
  payment_method: 0,
  billing_amount: 1900,
  name: '武田要',
  postal_code: '1000005',
  address: '東京都千代田区丸の内',
  shipping_cost: 800,
  status: 0
)

Delivery.create!(
  customer_id: Customer.find(2).id,
  name: '武田要',
  postal_code: '1000005',
  address: '東京都千代田区丸の内'
)

Product.create!(
  genre_id: Genre.find(2).id,
  name: "パフェ",
  explanation: "美味しいです",
  image_id: File.open('./app/assets/images/test.jpg'),
  price: 1000,
  is_active: true
)

OrderedProduct.create!(
  order_id: Order.find(1).id,
  product_id: Product.find(1).id,
  quantity: 1,
  status: 0,
  price: 1100
)

CartItem.create!(
  customer_id: Customer.find(1).id,
  product_id: Product.find(1).id,
  quantity: 5
)