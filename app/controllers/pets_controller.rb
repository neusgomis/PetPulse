class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      redirect_to dashboard_path, notice: 'Pet was successfully added!'
    else
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :avatar_pic, :species, :age, :breed, :color)
  end
end
