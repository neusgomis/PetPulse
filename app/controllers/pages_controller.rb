class PagesController < ApplicationController
  def dashboard
    @pets = current_user.pets
    @pet = Pet.new # for the form
    @created_pets = Pet.all
    @vets = User.where(vet: true)
  end
end
