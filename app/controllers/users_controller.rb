class UsersController < ApplicationController
  def pet_calender
    @user = current_user
    @pets = current_user.pets
    @bookings = current_user.bookings
    @booking = Booking.new

    if params[:query].present?
      @bookings = current_user.bookings.where("name ILIKE ?","%#{params[:query]}%")
    else
      @bookings = current_user.bookings
    end
  end
end
