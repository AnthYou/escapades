class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post)
    @user = User.find(params[:user_id])
    authorize @posts
  end
end
p
