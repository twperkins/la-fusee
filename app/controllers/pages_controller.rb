class PagesController < ApplicationController
  def home
    Booking::DESTINATION
    redirect_to spaceships_path
  end
end
