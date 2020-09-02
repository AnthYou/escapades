class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @trips = policy_scope(Trip)
    authorize @trips

    if params[:query].present?
      trip_ids = Trip.geocoded.search_by_country(params[:query]).pluck(:id)
      @trips   = Trip.where(id: trip_ids)
    end

    @selected_filters = []
    if params[:filter].present?
      @selected_filters = params[:filter][:tags].reject { |tag| tag == "" }
      @trips = @trips.tagged_with(@selected_filters)
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
    @activities = @trip.activities.order(:start_date)
    @markers = @activities.map.with_index do |activity, i|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        step: i + 1,
        transport_type: activity.transport_type,
        infoWindow: render_to_string(partial: "shared/info_window_activity", locals: { activity: activity })
      }
    end
    authorize @trip
  end

  def new
    @trip = Trip.new
    @tags_array = Trip.all.map do |trip|
      trip.all_tags_list
    end
    @tags = @tags_array.flatten.uniq
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

  def tagged
    if params[:tag].present?
      @trips = Trip.tagged_with(params[:tag])
    else
      @trips = Trip.all
    end
  end

  # def filter
  #     if params[:filter][:query].present?
  #        trip_ids = Trip.geocoded.search_by_destination(params[:filter][:query]).pluck(:id)
  #        @trips   = Trip.where(id: trip_ids)
  #     end

  #   query = <<~SQL
  #     trips.*,
  #     CASE WHEN departure_date > current_date THEN 1
  #          ELSE 2
  #     END AS departure_status_order,
  #     CASE WHEN COUNT(bookings.id) < max_capacity THEN 1
  #          ELSE 2
  #     END AS capacity_order,
  #     COUNT(bookings.id) as accepted_bookings_count
  #   SQL

  #   @trips = @trips
  #            .select(query)
  #            .joins("LEFT OUTER JOIN bookings ON bookings.trip_id = trips.id AND bookings.status = 'accepted'")
  #            .group("trips.id")
  #            .order(:departure_status_order, :capacity_order, departure_date: :asc)

  #   @trips = @trips.tagged_with(params[:filter].select { |k, v| v == '1' }.keys)
  #   skip_authorization
  #   render :index
  # end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :country, :city, :budget_min, :budget_max, :max_capacity, :return_date, :departure_date, :photo, :tag_list)
  end
end
