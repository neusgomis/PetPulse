class PagesController < ApplicationController
  def dashboard
    @pet = current_user.pets.first
    @pets = current_user.pets
    @pet_new = Pet.new # for the form
    @created_pets = Pet.all
    @vets = User.where(vet: true)
    @bookings = current_user.bookings
    @booking = Booking.new
    @bookings = Booking.where("pet_id = ? AND date_time >= ?", @pet.id, Time.now).order(:date_time).limit(6)
  end
end
