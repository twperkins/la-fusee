class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_spaceship, only: %i[show edit update destroy]

  def index
    @spaceships = Spaceship.all
    if params[:query].present?
      @spaceships = Spaceship.where("capacity >= ?", params[:query][:number_of_travellers])
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    if params.key?(:query) && params[:query][:destination].present?
      @destination = Destination.find(params[:query][:destination])
    else
      @destination = Destination.first
    end
  end

  def garage
    if user_check?
      @spaceships = Spaceship.where(user: current_user)
    else
      redirect_to new_spaceship_path
    end
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to garage_path
    else
      render 'new'
    end
  end

  def edit
    return unless @spaceship.user != current_user
  end

  def update
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  def destroy
    if @spaceship.user == current_user
      @spaceship.destroy
      redirect_to spaceships_path
    else
      redirect_to spaceship_path(@spaceship)
    end
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :capacity, :description, :image_url, :cost)
  end

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  def user_check?
    # returns true for owner, false for user
    current_user.spaceships.present?
  end
end
