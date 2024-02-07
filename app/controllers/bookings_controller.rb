class BookingsController < ApplicationController

  def index
  #  @bookings = Booking.all
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])

    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @bookings = Booking.where(date_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
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
    raise
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user

    if @booking.save
      redirect_to pet_bookings_path(@pet) # Modify this line to redirect to the desired page
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to pet_bookings_path(@booking.pet) # Modify this line to redirect to the desired page
  end

  def booking_params
    params.require(:booking).permit(:date_time, :description, :user_id, :pet_id)
  end
end
