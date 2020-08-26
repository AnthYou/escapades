class TripsController < ApplicationController
  def index
    @trips = policy_scope(Trip)
    authorize @trips

    @trips = Trip.geocoded
    @markers = @trips.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        step: '',
        infoWindow: render_to_string(partial: "shared/info_window_trips", locals: { trip: trip })
      }
    end
  end

  def show
    @trips = Trip.all
    @trip = Trip.find(params[:id])
    @activities = @trip.activities
    @markers = @activities.map.with_index do |activity, i|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        step: i + 1,
        infoWindow: render_to_string(partial: "shared/info_window_activity", locals: { activity: activity })
      }
    end

    authorize @trip
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :destination, :budget_min, :budget_max, :max_capacity, :return_date, :departure_date, :photo)
  end
end
