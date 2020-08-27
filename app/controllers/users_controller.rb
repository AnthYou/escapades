class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.all
    @user_reviews = @reviews.where(user_id: @user.id)
    @trips = Trip.where(user_id: @user.id)
    @markers = @trips.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude
      }
    end
    authorize @user
  end

  def dashboard
    @trips = Trip.all
    @user = current_user
    @trips_admin = @trips.where(user_id: @user.id)
    authorize @user
  end
end
