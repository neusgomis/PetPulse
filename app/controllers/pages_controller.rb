class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    @pets = current_user.pets
    @pet = Pet.new # for the form
    @created_pets = Pet.all
  end
end
