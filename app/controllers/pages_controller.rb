class PagesController < ApplicationController
  def home
    Booking::DESTINATION
  end

  def bookings
    @user = current_user
  end
end
