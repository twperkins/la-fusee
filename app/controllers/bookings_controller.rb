class BookingsController < ApplicationController

  def index
    @spaceships = Spaceship.where(user: current_user)
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @destination = Destination.find(params[:query])
    @booking = Booking.new
    # @booking = Booking.new(booking_params)
    # @booking.destination = @destination
    # @booking.approved = false
    # @booking.spaceship = @spaceship
    # @booking.user_id = current_user.id
    # @booking.create
    # @booking.save!
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @destination = Destination.find_by(name: params[:booking][:destination])
    @booking = Booking.new(booking_params)
    @booking.destination = @destination
    @booking.approved = false
    @booking.spaceship = @spaceship
    @booking.user_id = current_user.id
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :arrive, :depart, :passenger_quantity, :spaceship_id, :user_id, :destination_id)
  end
end
