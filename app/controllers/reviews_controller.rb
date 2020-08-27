class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @review.user = @user
    if @review.save
      redirect_to user_path(@user)
    else
      render :new
    end
    authorize @review
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
