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
    @current_trips = @user.bookings.select { |booking| booking.status == 'accepted' }.map { |booking| booking.trip }
    @past_trips = @trips.departed.select { |trip| trip.participants.include?(@user) && Date.today > trip.return_date }
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :description, :date_of_birth)
  end
end
