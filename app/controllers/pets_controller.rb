class PetsController < ApplicationController
  def show
    @pet = Pet.find(params[:id])
    @pets = current_user.pets.where.not(id: @pet.id)
    @pet_new = Pet.new # for the form
    @created_pets = Pet.all
    @vets = User.where(vet: true)
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      redirect_to dashboard_path, notice: 'Pet was successfully added!'
    else
      render "dashboard"
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :avatar_pic, :species, :age, :breed, :color, :vet_id, :weight)
  end
end
