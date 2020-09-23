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

    @bookings = @user.bookings.where(status: "accepted")

    @markers = @bookings.map do |booking|
      {
        lat: booking.trip.latitude,
        lng: booking.trip.longitude,
        infoWindow: render_to_string(partial: "shared/info_window_trips", locals: { trip: booking.trip })
      }
    end
    authorize @user
  end

  def dashboard
    @trips = Trip.all
    @user = current_user
    @trips_joined = @trips.select { |trip| trip.participants.include?(@user) }
    # @trips_admin = @trips.where(user_id: @user.id)
    # @current_trips = @trips.select { |trip| trip.participants.include?(@user) && Date.today < trip.return_date }
    # @past_trips = @trips.departed.select { |trip| trip.participants.include?(@user) && Date.today > trip.return_date }
    authorize @user
  end

  def follow
    @user = User.find(params[:id])
    if current_user.following?(@user)
      current_user.stop_following(@user)
      flash[:alert] = "You have unfollowed #{@user.first_name}."
    else
      current_user.follow(@user)
      flash[:notice] = "You are now following #{@user.first_name}."
    end
    redirect_to user_path(@user)
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :description, :date_of_birth)
  end
end
