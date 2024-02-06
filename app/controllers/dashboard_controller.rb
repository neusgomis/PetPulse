class DashboardController < ApplicationController
  before_action :find_pet, only: [:show]

  def show
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
