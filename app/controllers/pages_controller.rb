class PagesController < ApplicationController
  def home
  end

  def bookings
    @user = current_user
  end
end
