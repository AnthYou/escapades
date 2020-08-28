class BookingsController < ApplicationController
  # def new
  #   @booking = Booking.new
  #   authorize @booking
  #   @trip = Trip.find(params[:trip_id])
  # end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    authorize @booking
    @trip = Trip.find(params[:trip_id])
    @booking.trip = @trip
    @booking.user = @user
    @booking.status = 'pending'
    if @booking.save
      redirect_to trip_path(@trip)
    else
      flash[:alert] = @booking.errors.full_messages.join("; ")
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:description)
  end
end
