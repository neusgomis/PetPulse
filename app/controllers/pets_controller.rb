class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      redirect_to @pet, notice: 'Pet was successfully added!'
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :avatar_pic, :age)
  end
end
