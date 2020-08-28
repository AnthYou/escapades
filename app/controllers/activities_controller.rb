class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
    @trip = Trip.find(params[:trip_id])
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

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :location, :price, :start_date, :end_date, :url, :photo)
  end
end
