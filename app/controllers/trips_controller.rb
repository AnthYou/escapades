class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @trips = policy_scope(Trip)
    authorize @trips

    if params[:query].present?
      trip_ids = Trip.geocoded.search_by_destination(params[:query]).pluck(:id)
      @trips   = Trip.where(id: trip_ids)
    end

    query = <<~SQL
      trips.*,
      CASE WHEN departure_date > current_date THEN 1
           ELSE 2
      END AS departure_status_order,
      CASE WHEN COUNT(bookings.id) < max_capacity THEN 1
           ELSE 2
      END AS capacity_order,
      COUNT(bookings.id) as accepted_bookings_count
    SQL

    @trips = @trips
             .select(query)
             .joins("LEFT OUTER JOIN bookings ON bookings.trip_id = trips.id AND bookings.status = 'accepted'")
             .group("trips.id")
             .order(:departure_status_order, :capacity_order, departure_date: :asc)

    @markers = @trips.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        infoWindow: render_to_string(partial: "shared/info_window_trips", locals: { trip: trip })
      }
    end
  end

  def show
    @user = current_user
    @trip = Trip.find(params[:id])
    @booking = @trip.bookings.where(user_id: current_user.id).last if user_signed_in?
    @new_booking = Booking.new
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
      Booking.create(trip_id: @trip.id, user_id: current_user.id, status: 'accepted')
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :country, :city, :budget_min, :budget_max, :max_capacity, :return_date, :departure_date, :photo)
  end
end
