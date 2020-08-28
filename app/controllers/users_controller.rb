class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @reviews = Review.all
    # # @user_reviews = @reviews.where(booking.trip.user_id= @user.id)
    # @user_reviews = []
    # @user.bookings.each do |booking|
    #   booking.reviews.each do |review|
    #     @user_reviews << review
    #   end
    # end

    @user_reviews = @user.received_reviews

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

  private
  def user_params
    params.require(:user).permit( :email, :password, :first_name, :last_name, :description, :date_of_birth)
  end
end
