class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
  end

def create
  @pet = Pet.find(params[:pet_id])
  @booking = Booking.new(booking_params)
  @booking.pet = @pet


  if @booking.save
    redirect_to pet_bookings_path(@pet)
  else
    render :new, status: :unprocessable_entity
  end
end

  def booking_params
    params.require(:booking).permit(:date_time, :description)
  end
end
