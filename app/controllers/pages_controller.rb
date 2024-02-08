class PagesController < ApplicationController
  def dashboard
    @pet = current_user.pets.first
    @pets = current_user.pets.where.not(id: @pet.id)
    @pet_new = Pet.new # for the form
    @created_pets = Pet.all
    @vets = User.where(vet: true)
  end
end
