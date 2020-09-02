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

  def show
    @post = Post.find(params[:id])
    authorize @post
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
    if params[:trip_id]
      @post.trip_id = params[:trip_id]
      if @post.save
        redirect_to trip_path(params[:trip_id])
      else
        render :new
      end
    else
      @post.trip_id = Booking.find(params[:post][:trip_id]).trip.id
      @post.save
      if @post.save
        redirect_to user_path(current_user.id)
      else
        render :new
      end
    end
  end

  def like
    @post = Post.find(params[:id])
    authorize @post

    if current_user.liked? @post
      current_user.unlike @post
    else
      current_user.likes @post
    end

    @likes_counter = @post.get_likes.size
    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :photo, :trip)
  end
end
