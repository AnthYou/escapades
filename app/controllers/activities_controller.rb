class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
    @trip = Trip.find(params[:trip_id])
    @departure_date = @trip.departure_date.strftime("%d-%m-%Y")
    @return_date = @trip.return_date.strftime("%d-%m-%Y")
    @activity.trip = @trip
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @trip = Trip.find(params[:trip_id])
    @activity.trip = @trip
    authorize @activity

    if @activity.save
      redirect_to trip_path(@trip)
    else
      flash[:alert] = @activity.errors.full_messages.join("; ")
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
    @trip = @activity.trip
    @departure_date = @trip.departure_date.strftime("%d-%m-%Y")
    @return_date = @trip.return_date.strftime("%d-%m-%Y")
    @first_activity = @trip.activities.order(:start_date).first
    authorize @activity
  end

  def update
    @activity = Activity.find(params[:id])
    authorize @activity
    @trip = @activity.trip
    if @activity.update(activity_params)
      redirect_to trip_path(@trip)
    else
      flash[:alert] = @activity.errors.full_messages.join("; ")
      render :new
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    authorize @activity
    @trip = @activity.trip
    @activity.destroy
    redirect_to trip_path(@trip)
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :country, :city, :price, :start_date, :end_date, :url, :transport_type, :photo)
  end
end
