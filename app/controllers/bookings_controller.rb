class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @pet = Pet.find(params[:pet_id])
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user_id = current_user

    if @booking.save
      redirect_to pets_path(@pet) # Modify this line to redirect to the desired page
    else
      render :new, status: :unprocessable_entity
    end
  end

  def booking_params
    params.require(:booking).permit(:date_time, :description, :user_id, :pet_id)
  end
end
