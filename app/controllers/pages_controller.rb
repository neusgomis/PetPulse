class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    @pets = current_user.pets if current_user
  end
end
