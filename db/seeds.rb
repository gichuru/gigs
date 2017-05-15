# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.where(name: "Web Development").first_or_create(name: "Web Development")
Category.where(name: "Data Entry").first_or_create(name: "Data Entry")
Category.where(name: "Front Office").first_or_create(name: "Front Office")

location = [
	"Nairobi, Kenya",
	"Mombasa, Kenya",
	"Nyeri, Kenya",
	"Nakuru, Kenya",
	"Kakamega, Kenya"
]

User.where(email: "testing@testing.com").first_or_create(email: "Ninja boss", password: "12")

5.times do
	User.create( email: Faker::Internet.email, password: "pwd")
end


3.times do 
	Gig.create(name: Faker::Name.title,
				description: Faker::Lorem.paragraph(5),
				budget: rand(5000..50000),
				location: location.sample,
				duration: rand(1..6),
				startdate: Faker::Date.forward(23),
				user_id: 1,
				category_id: rand(1..3)
				)
end