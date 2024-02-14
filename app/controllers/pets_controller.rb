class PetsController < ApplicationController
  def show
    @pet = Pet.find(params[:id])
    @pets = current_user.pets
    @pet_new = Pet.new # for the form
    @created_pets = Pet.all
    @vets = User.where(vet: true)
    @message = Message.new
    @bookings = @pet.bookings
    @booking = Booking.new
    @upcoming_bookings = Booking.where("user_id = ? AND date_time >= ?", current_user.id, Date.today).order(:date_time).limit(6)
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

  def time(date_time)
    "#{date_time.strftime('%A, %b %d')}"
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :avatar_pic, :species, :age, :breed, :color, :vet_id, :weight)
  end
end
