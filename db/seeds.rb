# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# シードデータ
# admin
Admin.create!(
	email: "test_admin@gmail.com",
	password: "password"
)

# customer
familynames = %w{
  佐藤:サトウ:sato
  鈴木:スズキ:suzuki
  高橋:タカハシ:takahasi
  田中:タナカ:tanaka
}

givennames = %w{
  太郎:タロウ:taro
  二郎:ジロウ:jiro
  三郎:サブロウ:saburo
  花子:ハナコ:hanako
  松子:マツコ:matuko
}

20.times do |n|
  i = n + 1
  fn = familynames[n % 4].split(":")
  gn = givennames[n % 5].split(":")

  Customer.create!(
    kanji_familyname: fn[0],
    kanji_firstname: gn[0],
    kana_familyname: fn[1],
    kana_firstname: gn[1],
    email: "#{fn[2]}_#{gn[2]}@gmail.com",
    password: "password",
    telephone_number: (100000000000 - i).to_s,
    postal_code: (1000000 + i).to_s,
    address: "東京都千代田区",
    is_deleted: [true, false].sample
  )
end

# delivery
30.times do |n|
  i = Random.rand(20) + 1
  fn = familynames[i % 4].split(":")
  gn = givennames[i % 5].split(":")
  
  Delivery.create!(
    customer_id: Customer.find(i).id,
    name: fn[0] + gn[0],
    postal_code: (1000000 + i).to_s,
    address: "東京都千代田区"
  )
end

# genre
genre_names = %w{
  プリン
  ケーキ
  マカロン
  シュークリーム
}

4.times do |n|
  Genre.create!(
    name: genre_names[n],
    is_active: [true, false].sample
  )
end

# product
product_types = %w{
  バニラ
  チョコレート
  抹茶
}

12.times do |n|
  i = Random.rand(20) + 1
  pt = product_types[n % 3]
  gn = genre_names[n % 4]
  
  Product.create!(
    genre_id: Genre.find(((n % 3) + 1).to_i).id,
    name: pt + gn,
    explanation: "美味しいです",
    image_id: File.open("./app/assets/images/test.jpg"),
    price: (i.to_s + "00").to_i,
    is_active: [true, false].sample
  )
end

# price calculation
product_select = Array.new
quantity = Array.new
ordered_product_price = Array.new
total_price = Array.new
count = 0
60.times do |n|
  product_select[n] = Random.rand(12) + 1
  quantity[n] = Random.rand(6) + 1

  ordered_product_price[n] = (Product.find(product_select[n]).price * 1.1).to_i
end

#total_price
30.times do |n|
  total_price[n] = Product.find(product_select[count]).price * quantity[count] + Product.find(product_select[count + 1]).price * quantity[count + 1]

  count += 1
end


# order
30.times do |n|
  i = Random.rand(20)
  fn = familynames[i % 4].split(":")
  gn = givennames[i % 5].split(":")

  Order.create!(
    customer_id: Customer.find(i + 1).id,
    payment_method: Random.rand(2),
    billing_amount: total_price[n],
    name: fn[0] + gn[0],
    postal_code: (1000000 + i).to_s,
    address: "東京都千代田区",
    shipping_cost: 800,
    status: 0
  )

  count += 1
end

# order_product
60.times do |n|    
  OrderedProduct.create!(
    order_id: Order.find((n / 2) + 1).id,
    product_id: Product.find(product_select[n]).id,
    quantity: quantity[n],
    status: 0,
    price: ordered_product_price[n]
  )
end

# cart_item
30.times do |n|
  i = Random.rand(12) + 1
  quantity = Random.rand(6)
  customer = Random.rand(20) + 1
  
  CartItem.create!(
    customer_id: Customer.find(customer).id,
    product_id: Product.find(i).id,
    quantity: quantity,
  )
end