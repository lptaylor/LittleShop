# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

User.destroy_all
Item.destroy_all
Order.destroy_all
OrderItem.destroy_all

admin_1 = User.create!(name: "Ali", address: "Turing Cellar", city: "Denver", state: "Colorado", zipcode: 80000, email: "Ali@gmail.com", password: "1234", role: 2)
admin_2 = User.create!(name: "Aaron", address: "Turing Cellar", city: "Denver", state: "Colorado", zipcode: 80000, email: "Aaron@gmail.com", password: "1234", role: 2)
admin_3 = User.create!(name: "Lance", address: "Turing Cellar", city: "Denver", state: "Colorado", zipcode: 80000, email: "Lance@gmail.com", password: "1234", role: 2)
admin_4 = User.create!(name: "Justin", address: "Turing Cellar", city: "Denver", state: "Colorado", zipcode: 80000, email: "Justin@gmail.com", password: "1234", role: 2)

merch_1 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name, role: 1)
merch_2 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name, role: 1)
merch_3 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name, role: 1)
merch_4 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name, role: 1)
merch_5 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name, role: 1)

user_1 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: "merch@aol.com", password: "1234")
user_2 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_3 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_4 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_5 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_6 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_7 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_8 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_9 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_11 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_10 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_12 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_13 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_14 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)
user_15 = User.create!(name: Faker::Name.unique.name, address: Faker::Address.unique.street_address , city: Faker::Address.unique.city, state: Faker::Address.state, zipcode: Faker::Address.unique.zip, email: Faker::Internet.unique.safe_email, password: Faker::Dog.unique.name)


item_1 = Item.create!(user: merch_1, item_name: "Hot Dog", image_url: "https://images-na.ssl-images-amazon.com/images/I/41TWffIcWxL._SL500_AC_SS350_.jpg", inventory: 10, price: 25, description: "This is a beautiful, handmade hotdog dog costume.")
item_2 = Item.create!(user: merch_1, item_name: "Holiday Tails Light-Up Royal Fir Dog Hoodie", image_url: "https://petco.scene7.com/is/image/PETCO/2875901-center-1?$ProductDetail-large$", inventory: 20, price: 15, description: "This is a beautiful, handmade Christmas tree dog costume. You won't even be able to tell it apart from the real thing. Pine scent diffuser included")
item_3 = Item.create!(user: merch_1, item_name: "Star Wars Bantha Dog Costume", image_url: "https://wholesalehalloweencostumes-weblinc.netdna-ssl.com/product_images/star-wars-bantha-dog-costume/5756e41d69702d07970003c1/zoom.jpg?c=1496432434", inventory: 10, price: 25, description: "Calling all Star Wars fans, this is a beautiful, handmade Star Wars Bantha dog costume.")
item_4 = Item.create!(user: merch_1, item_name: "Turtle Dog Costume", image_url: "https://img.wondercostumes.com/products/12-3/turtle-dog-costume.jpg ", inventory: 10, price: 25, description: "Made for people who wished they had a turtle for a pet instead, this is a beautiful, handmade turtle dog costume.")
item_5 = Item.create!(user: merch_1, item_name: "Unicorn Dog", image_url: "https://www.chewy.com/petcentral/wp-content/uploads/2018/08/29736886_1819080608391969_6113152043319296000_n.jpg", inventory: 10, price: 25, description: "Looks like a real unicorn!!")
item_6 = Item.create!(user: merch_2, item_name: "Beer Carrying Dog", image_url: "https://www.chewy.com/petcentral/wp-content/uploads/2018/08/23417048_164385327490239_6690468868504158208_n.jpg", inventory: 10, price: 25, description: "This is the perfect costume for all those party dogs out there")
item_7 = Item.create!(user: merch_2, item_name: "Walrus Dog Costume", image_url: "https://www.detectview.com/wp-content/uploads/2018/05/Walrus-Pet-Halloween-Costume.jpg", inventory: 10, price: 25, description: "Expertly crafted walrus dog costume, your pup will love it!")
item_8 = Item.create!(user: merch_2, item_name: "Hammerhead Shark Dog Costume", image_url: "https://images-na.ssl-images-amazon.com/images/I/81Bx1l67SpL._SX466_.jpg", inventory: 10, price: 25, description: "This is a very realistic, handmade hammerhead shark dog costume. Warning: Do Not Take to the Beach")
item_9 = Item.create!(user: merch_2, item_name: "Mermaid Dog Costume", image_url: "https://partycity4.scene7.com/is/image/PartyCity/_mobile_?$_600x400_$&$product=PartyCity/P815188_full", inventory: 10, price: 25, description: "This costume is perfect for the dog that loves The Little Mermaid as much as you")
item_10 = Item.create!(user: merch_2, item_name: "Musician Dog Costume", image_url: "https://images-na.ssl-images-amazon.com/images/I/51gdCPc-bkL._SL500_AC_SS350_.jpg", inventory: 10, price: 25, description: "This is a beautiful, handmade musician dog costume. Guitar and Boombox included")
item_11 = Item.create!(user: merch_3, item_name: "Stegosaurus Dog Costume", image_url: "https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._SL500_AC_SS350_.jpg", inventory: 10, price: 25, description: "This is a beautiful, handmade Stegosaurus dog costume.  The glitter scales are so lifelike, you'll think that you're in Jurassic Park")
item_12 = Item.create!(user: merch_3, item_name: "Donald Duck Dog Costume", image_url: "https://media1.popsugar-assets.com/files/thumbor/QXIiK3UtIEflF6S1-P6JFRo1z_o/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2018/09/20/984/n/24155406/707bc2d25ba4214963eb57.45679332_/i/Disney-Pet-Costumes.jpg", inventory: 10, price: 25, description: "Quack Quack Quack")
item_13 = Item.create!(user: merch_3, item_name: "Lion Dog Costume", image_url: "https://ae01.alicdn.com/kf/HTB1ew55u7yWBuNjy0Fpq6yssXXaR/NOCM-Criniere-wig-for-Halloween-Lion-Clothing-Dog-Costume-Brown.jpg", inventory: 10, price: 25, description: "This is a beautiful, handmade lion costume that can also double as scarf in the winter.")
item_14 = Item.create!(user: merch_3, item_name: "Hockey Dog Costume", image_url: "http://www.celebritydachshund.com/wp-content/uploads/2017/01/ball-hockey-crusoe-1024x1020.jpg", inventory: 10, price: 25, description: "The perfect costume for hockey fans")
item_15 = Item.create!(user: merch_3, item_name: "Ghostbuster Dog Costume", image_url: "https://costumesupercenter-weblinc.netdna-ssl.com/product_images/pets-ghostbusters-jumpsuit-dog-costume/573d480b69702d70de001507/large_thumb.jpg?c=1535022835", inventory: 100, price: 25, description: "This is a beautiful, handmade Ghostbusters dog costume. Includes fulling functioning proton backpack for all your ghost fighting needs")
item_16 = Item.create!(user: merch_3, item_name: "Turkey Dog Costume", image_url: "https://media1.popsugar-assets.com/files/thumbor/FlFJU7C0ya_w5Rn7gsxahrE0mCA/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2018/10/05/716/n/24155406/72f1815eb28b8585_netimgmSmoNz/i/Turkey-Dog-Costume.webp", inventory: 10, price: 25, description: "Gobble till ya Wobble")
item_17 = Item.create!(user: merch_3, item_name: "Banana Dog Costume", image_url: "https://i.pinimg.com/originals/6d/d8/be/6dd8bee2c35400a174fa7eff20b5c522.jpg", inventory: 10, price: 25, description: "This is a beautiful, handmade banana dog costume.")
item_18 = Item.create!(user: merch_4, item_name: "Lobster Dog Costume", image_url: "https://cdn3.volusion.com/uxmhm.qxgbz/v/vspfiles/photos/68243-2.jpg?1540987821", inventory: 10, price: 25, description: "This is a beautiful, handmade lobster dog costume. Watch out for the claws, they may be sharp!")
item_19 = Item.create!(user: merch_4, item_name: "Cupcake Dog Costume", image_url: "https://i.ebayimg.com/images/g/z4UAAOSwfrxZ15Ie/s-l640.jpg", inventory: 10, price: 25, description: "The perfect costume for a sweet pup")
item_20 = Item.create!(user: merch_4, item_name: "Goldfish Dog Costume", image_url: "https://images-na.ssl-images-amazon.com/images/I/91XQ9tLWHAL._SX466_.jpg", inventory: 10, price: 25, description: "This is a beautiful, handmade goldfish dog costume. Warning: Not Waterproof")
item_21 = Item.create!(user: merch_4, item_name: "Cowboy Dog Costume", image_url: "https://images.britcdn.com/wp-content/uploads/2016/08/RRADQ.0.jpg?w=1000&auto=format", inventory: 10, price: 25, description: "Yeehaw!")
item_22 = Item.create!(user: merch_4, item_name: "Giraffe Dog Costume", image_url: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1539114804-41uUguNm2nL.jpg?crop=1xw:1xh;center,top&resize=768:*", inventory: 10, price: 25, description: "This is a beautiful, handmade giraffe dog costume.")
item_23 = Item.create!(user: merch_5, item_name: "Pirate Dog Costume", image_url: "https://purewows3.imgix.net/images/articles/2018_08/dog_pirate_costume.jpg?auto=format,compress&cs=strip", inventory: 10, price: 25, description: "This is a beautiful, handmade pirate dog costume.")
item_24 = Item.create!(user: merch_5, item_name: "Butterfly Dog Costume", image_url: "https://www.workingmother.com/sites/workingmother.com/files/styles/1000_1x_/public/import/2011/files/_images/201109/butterfly.jpg?itok=fe0LWjRT", inventory: 10, price: 25, description: "This is a delicate, handmade butterfly dog costume. Looks great on all pups")
item_25 = Item.create!(user: merch_5, item_name: "Pineapple Dog Costume", image_url: "http://www4.pictures.livingly.com/mp/9TOBMoxRFgyl.jpg", inventory: 10, price: 20, description: "This is a beautiful, handmade pineapple dog costume.")
item_26 = Item.create!(user: merch_5, item_name: "Bumblebee Dog Costume", image_url: "https://images-na.ssl-images-amazon.com/images/I/71X4X-5LILL._SX466_.jpg", inventory: 10, price: 20, description: "This is a beautiful, handmade Bumblebee dog costume. Your pup will happily buzz around in this one!")
item_27 = Item.create!(user: merch_5, item_name: "Sheep Dog Costume", image_url: "https://i.pinimg.com/originals/64/99/17/649917bb5702c3ed7c44b23892cd422e.jpg", inventory: 10, price: 20, description: "This is a beautiful, handmade sheep dog costume.")

order_1 = Order.create(user: user_1)
order_2 = Order.create(user: user_2)
order_3 = Order.create(user: user_3)
order_4 = Order.create(user: user_4)
order_5 = Order.create(user: user_5)
order_6 = Order.create(user: user_6)
order_7 = Order.create(user: user_7)
order_8 = Order.create(user: user_8)
order_9 = Order.create(user: user_9)
order_10 = Order.create(user: user_10)
order_11 = Order.create(user: user_11)
order_12 = Order.create(user: user_13)
order_13 = Order.create(user: user_14)
order_14 = Order.create(user: user_15)

order_item_1 = OrderItem.create(item: item_1, order: order_1, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 10.days.ago, price: item_1.price)
order_item_2 = OrderItem.create(item: item_2, order: order_1, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 9.days.ago, price: item_2.price)
order_item_3 = OrderItem.create(item: item_3, order: order_1, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 4.days.ago, price: item_3.price)
order_item_4 = OrderItem.create(item: item_4, order: order_2, quantity: 2, fulfilled: true, created_at: 12.days.ago, updated_at: 2.days.ago, price: item_4.price)
order_item_5 = OrderItem.create(item: item_5, order: order_3, quantity: 2, fulfilled: true, created_at: 12.days.ago, updated_at: 1.days.ago, price: item_5.price)
order_item_6 = OrderItem.create(item: item_6, order: order_4, quantity: 2, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: item_6.price)
order_item_7 = OrderItem.create(item: item_7, order: order_5, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: item_7.price)
order_item_8 = OrderItem.create(item: item_8, order: order_5, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 3.days.ago, price: item_8.price)
order_item_9 = OrderItem.create(item: item_9, order: order_6, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: item_9.price)
order_item_10 = OrderItem.create(item: item_10, order: order_7, quantity: 2, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: item_10.price)
order_item_11 = OrderItem.create(item: item_11, order: order_8, quantity: 2, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: item_11.price)
order_item_12 = OrderItem.create(item: item_12, order: order_9, quantity: 3, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: item_12.price)
order_item_13 = OrderItem.create(item: item_13, order: order_10, quantity: 3, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: item_13.price)
order_item_14 = OrderItem.create(item: item_14, order: order_11, quantity: 3, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: item_14.price)
order_item_15 = OrderItem.create(item: item_15, order: order_12, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: item_15.price)
order_item_16 = OrderItem.create(item: item_16, order: order_13, quantity: 5, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: item_16.price)
order_item_17 = OrderItem.create(item: item_17, order: order_14, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: item_17.price)
order_item_18 = OrderItem.create(item: item_18, order: order_14, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: item_18.price)
order_item_19 = OrderItem.create(item: item_19, order: order_15, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: item_19.price)
order_item_20 = OrderItem.create(item: item_20, order: order_15, quantity: 1, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: item_20.price)


p "Created #{Item.count} items"
p "Created #{User.count} users"
p "Created #{Order.count} orders"
p "Created #{Order_item.count} orders_items"
