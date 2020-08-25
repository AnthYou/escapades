class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :destination, :budget_min, :budget_max, :capacity, :return_date, :departure_date, :photo)
  end
end
