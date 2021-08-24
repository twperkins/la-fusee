class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new(booking_params)
    @booking.spaceship = @spaceship
    if @booking.save
      redirect_to spaceship_path(@spaceship)
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to spaceships_path
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :destination, :location, :arrive, :depart, :passenger_quantity, :spaceship_id, :user_id)
  end
end
