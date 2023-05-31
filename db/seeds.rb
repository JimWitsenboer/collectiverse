require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Clearing all toys"
Toy.destroy_all
puts "All toys gone!"
puts "Clearing all users"
User.destroy_all
puts "All users gone!"

puts "Creating 'user' for you!"

user_kenny = User.create(email: "kenny@gmail.com", password: "admin123", username: "kennydevin", first_name: "Kenny", last_name: "Devin" )
user_jim = User.create(email: "jim@gmail.com", password: "admin123", username: "jimladen", first_name: "Jim", last_name: "Laden" )
user_nick = User.create(email: "nick@gmail.com", password: "admin123", username: "nick69coolz", first_name: "Nick", last_name: "Sodad" )
user_mary = User.create(email: "mary@gmail.com", password: "admin123", username: "malopii", first_name: "Mary", last_name: "Yetta" )

puts "'User' created"
puts "Creating 'toys' for you!"

file = URI.open("https://images.tokopedia.net/img/cache/900/product-1/2019/7/14/64483621/64483621_e256c17c-121b-414d-b76f-559f517bb5c5_684_520.jpg")
toy1 = Toy.new(name: "Funko POP! Chewbacca", description: "Chewbacca BIB", price: 20, user_id: user_nick.id )
toy1.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy1.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2023/5/7/bcbd72f7-75b0-46fb-baf6-6b0046b46368.jpg")
toy2 = Toy.new(name: "Studio Series Bumblebee", description: "Dent on hand, Used", price: 90, user_id: user_kenny.id )
toy2.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy2.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2021/8/21/6dd3c0ab-a456-42c2-b3ce-92af67c2359d.jpg")
toy3 = Toy.new(name: "Hot Toys Superman", description: "New, limited stock", price: 450, user_id: user_jim.id )
toy3.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy3.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2021/6/17/fecffe99-69be-4737-9057-95ee9f790f5e.jpg")
toy4 = Toy.new(name: "Prime1 Optimus Prime", description: "Used", price: 950, user_id: user_jim.id )
toy4.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy4.save

file = URI.open("https://images.tokopedia.net/img/cache/900/product-1/2019/3/6/42403996/42403996_0f488924-bf60-45f5-ae3f-4168c480aedc_1000_1000.jpg")
toy5 = Toy.new(name: "Studio Series Jetfire", description: "Good condition", price: 120, user_id: user_nick.id )
toy5.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy5.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2023/4/27/fb244406-3be8-4a52-ad18-b98078530ced.jpg")
toy6 = Toy.new(name: "Warhammer 40000 - Adeptus Sororitas Battle Sisters Squad", description: "The Battle Sisters make up the vast majority of each of the Orders Militant, gunning down heretic, xenos and traitor alike with their holy trinity of weaponry", price: 60, user_id: user_mary.id )
toy6.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy6.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2023/4/27/c9acd323-36c8-4ab1-820c-3887177daae5.jpg")
toy7 = Toy.new(name: "Warhammer 40000 - Combat Patrol: Adepta Sororitas", description: "The above units are supplied with 17x 32mm round bases, 7x 25mm round bases, 3x 45mm flying bases, 1x 50mm round base, and an Adepta Sororitas transfer sheet.", price: 100, user_id: user_mary.id )
toy7.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy7.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2022/12/6/38f6139c-615f-4963-b232-569bf2b48be0.jpg")
toy8 = Toy.new(name: "Warhammer Age Of Sigmar Battleforce Daughters of Khaine", description: "As deadly as they are graceful, the warlike aelves of the Daughters of Khaine seek to spill sacred torrents of blood in the name of their violent deity.", price: 70, user_id: user_nick.id )
toy8.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy8.save

file = URI.open("https://images.tokopedia.net/img/cache/900/hDjmkQ/2021/6/13/8394970e-06f5-49ec-a2b6-aa3e7dc3b42f.jpg")
toy9 = Toy.new(name: "Warhammer 40k Paint + tools Set", description: "Building and painting models is a fun and exciting way to engage with the hobby, and it only gets more rewarding with time. Youll need a few tools and a set of paints to get started, and this box includes the basics that will form the core of your hobby kit.", price: 50, user_id: user_nick.id )
toy9.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy9.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2023/1/13/8bd342fa-f149-4cf8-a1e6-18ddd3bcc719.jpg")
toy10 = Toy.new(name: "Warhammer 40K SMH 2023 Blood Angels Collection Two", description: "Contains 1 only", price: 10, user_id: user_kenny.id )
toy10.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy10.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2022/3/18/b5927f63-3a5a-4193-bcd3-e078f7f3b908.jpg")
toy11 = Toy.new(name: "Warhammer 40k Kill Team: T'au Empire Pathfinders", description: "Tau only", price: 50, user_id: user_kenny.id )
toy11.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy11.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2022/3/3/0f600fc9-b7fc-483b-b5cb-c1db4f9d4f97.jpg")
toy12 = Toy.new(name: "SHF Deadpool", description: "Japan ver", price: 70, user_id: user_nick.id )
toy12.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy12.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2022/12/3/0289af02-c855-48f8-8f24-0b69c59c84ab.jpg")
toy13 = Toy.new(name: "SHF Figure Rise Standard Amplified Alphamon Digimon", description: "New", price: 40, user_id: user_nick.id )
toy13.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy13.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2022/1/8/a3cb2bdb-06e5-4ed1-87d7-f1dc8b14ff73.jpg")
toy14 = Toy.new(name: "SHF Yuji Itadori - Jujutsu Kaisen", description: "New", price: 60, user_id: user_jim.id )
toy14.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy14.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2020/12/11/ac2c2dd2-4e21-4b01-8e3d-2abadb6c353f.jpg")
toy15 = Toy.new(name: "SHF Figuarts Kamen Rider Build Rabbit Rabbit Form Figure", description: "New", price: 60, user_id: user_jim.id )
toy15.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy15.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2022/1/12/a7f5e0ca-a8f3-4646-9e2e-6f5d61335159.jpg")
toy16 = Toy.new(name: "SHF Naruto", description: "Used", price: 120, user_id: user_mary.id )
toy16.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy16.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2021/3/2/af3d9de5-5c0e-433e-b693-6df502b59997.jpg")
toy17 = Toy.new(name: "Funko POP! Freddy Mercury", description: "Used", price: 220, user_id: user_kenny.id )
toy17.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy17.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2021/12/30/c7438649-1d63-4e57-a326-d76f8b0f5a6f.jpg")
toy18 = Toy.new(name: "Funko POP! Rapunzel", description: "Used", price: 40, user_id: user_nick.id )
toy18.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy18.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2020/11/11/c4d13bc1-2e9d-43a8-b3f6-73823ae86d23.jpg")
toy19 = Toy.new(name: "Figma 366 FGO Ruler", description: "Used", price: 130, user_id: user_jim.id )
toy19.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy19.save

file = URI.open("https://images.tokopedia.net/img/cache/900/VqbcmM/2020/10/14/029b5cc2-974c-455f-8d7a-f5aeca3aadd6.jpg")
toy20 = Toy.new(name: "Figma Saitama", description: "MISB", price: 40, user_id: user_mary.id )
toy20.photo.attach(io: file, filename: "image-seed.jpg", content_type: "image/jpg")
toy20.save

puts "'Toy' created"
