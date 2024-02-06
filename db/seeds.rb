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
User.create!(email: "jasonbourne@gmail.com", password: "123456", first_name: "Jason", last_name: "Bourne")

User.create!(email: "johnsmith@gmail.com", password: "abcdef", first_name: "John", last_name: "Smith")

User.create!(email: "janedoe@gmail.com", password: "123456", first_name: "Jane", last_name: "Doe")


Pet.create!(name: "Buddy", breed: "Golden Retriever", species: "Dog", weight: 70.05, age: 1, gender: "man", user_id: 1, vet_id: 1)
Pet.create!(name: "Max", breed: "Labrador Retriever", species: "Dog", weight: 65.05, age: 2, gender: "male", user_id: 2, vet_id: 2)
Pet.create!(name: "Luna", breed: "Siamese", species: "Cat", weight: 8.05, age: 3, gender: "female", user_id: 3, vet_id: 3)


