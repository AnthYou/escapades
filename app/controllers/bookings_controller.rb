class BookingsController < ApplicationController
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

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "cancelled"
    @booking.save
    redirect_to trip_path(@booking.trip)
  end

  def review
    @trip = Trip.find(params[:trip_id])
    @bookings = @trip.bookings.where(status: "pending")
    authorize @trip, :review?
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "accepted"
    if @booking.save
      redirect_to trip_review_booking_path(@booking.trip)
    else
      flash[:alert] = "An error has occured"
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "declined"
    if @booking.save
      redirect_to trip_review_booking_path(@booking.trip)
    else
      flash[:alert] = "An error has occured"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:description)
  end
end
