# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a pets
jason_bourne=User.create!(email: "jasonbourne@gmail.com", password: "123456", first_name: "Jason", last_name: "Bourne")

james_bond = User.create!(email: "johnsmith@gmail.com", password: "abcdef", first_name: "John", last_name: "Smith")

slimd_shady= User.create!(email: "janedoe@gmail.com", password: "123456", first_name: "Jane", last_name: "Doe")

first_vet = User.create!(email: "testvet@gmail.com", password: "123456",  first_name: "Test", last_name: "Vet", vet: true)


Pet.create!(name: "Buddy", breed: "Golden Retriever", species: "Dog", weight: 70.05, age: 1, gender: "male", user: jason_bourne, vet: james_bond)
Pet.create!(name: "Max", breed: "Labrador Retriever", species: "Dog", weight: 65.05, age: 2, gender: "male", user: jason_bourne, vet: jason_bourne)
Pet.create!(name: "Luna", breed: "Siamese", species: "Cat", weight: 8.05, age: 3, gender: "female", user: jason_bourne, vet: jason_bourne)
