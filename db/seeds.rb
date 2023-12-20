# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# seeds.rb

# Create some users
user1 = User.create(name: "John Doe")
user2 = User.create(name: "Jane Smith")

# Create some foods
food1 = Food.create(name: "Chicken Breast", measurement_unit: "grams", price: 8.99, quantity: 500, user: user1)
food2 = Food.create(name: "Salmon Fillet", measurement_unit: "pieces", price: 12.99, quantity: 300, user: user2)

# Create some recipes
recipe1 = Recipe.create(name: "Grilled Chicken Salad", preparation_time: 20, cooking_time: 15, description: "A healthy and delicious salad with grilled chicken.", public: true, user: user1)
recipe2 = Recipe.create(name: "Baked Salmon with Lemon", preparation_time: 15, cooking_time: 20, description: "A flavorful salmon dish baked with lemon slices.", public: false, user: user2)

# Associate foods with recipes
RecipeFood.create(quantity: 300, food: food1, recipe: recipe1)
RecipeFood.create(quantity: 200, food: food2, recipe: recipe2)

puts "Seed data created successfully."

