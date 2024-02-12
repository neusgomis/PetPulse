class PagesController < ApplicationController
  def dashboard
    @pet = current_user.pets.first
    @pets = current_user.pets
    @pet_new = Pet.new # for the form
    @created_pets = Pet.all
    @vets = User.where(vet: true)
    @bookings = current_user.bookings
    @booking = Booking.new
    @upcoming_bookings = Booking.where("user_id = ? AND date_time >= ?", current_user.id, Date.today).order(:date_time).limit(6)
  end
end
