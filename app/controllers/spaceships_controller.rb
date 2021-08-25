class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: %i[show edit update destroy]

  def index
    @spaceships = Spaceship.all
    if params[:query].present?
      @spaceships = Spaceship.where(capacity: params[:query][:number_of_travellers])
    else
      @spaceships = Spaceship.all
    end
  end

  def show; end

  def garage
    @spaceships = Spaceship.where(user: current_user)
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  def destroy
    @spaceship.destroy
    redirect_to spaceships_path
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :capacity, :description)
  end

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end
end
