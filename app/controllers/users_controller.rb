class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.all
    @user_reviews = @reviews.where(user_id: @user.id)
    authorize @user
  end
end
