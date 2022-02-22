# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    name: "Admin Account",
    email:"admin@admin.com",
    password: "admin",
    password_confirmation: "admin",
    bio: "This is the admin account"
)


50.times do |n|
    User.create!(name: Faker::Name.name,
                email: "email#{n+1}@email.com",
                password: 'password',
                password_confirmation: "password",
                bio: Faker::Quote.yoda
            )
end

100.times do
    Product.create!(product_name: Faker::Food.dish,
                    product_description: Faker::Food.description,
                    price: rand(1..500),
                    quantity: rand(1..100)
                )
end