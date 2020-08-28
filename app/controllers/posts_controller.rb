class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post)
    if params[:user_id] != nil
      @user = User.find(params[:user_id])
    end
    authorize @posts
    if params[:trip_id] != nil
      @trip = Trip.find(params[:trip_id])
    end
  end

  def new
    @post = Post.new
    @user = current_user
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user_id = current_user.id
    # @post.save
    if @post.save!
      redirect_to user_posts_path(current_user.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :photo, :trip_id)
  end
end