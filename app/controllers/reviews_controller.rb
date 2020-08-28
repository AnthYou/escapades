class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review

  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      redirect_to user_path(@booking.user)
    else
      render :new
    end
    authorize @review
  end

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
