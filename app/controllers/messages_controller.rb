class MessagesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    policy_scope(Message)

    unless current_user.accepted_in?(@trip.id)
      flash[:alert] = "You cannot access to this chatroom."
      return redirect_to trip_path(@trip)
    end

    @trip.bookings.where(status: "accepted").each do |booking|
      booking.notifications.each do |notification|
        if (notification.notification_type == "new-chat-activity") && (notification.receiver == current_user)
          notification.read = true
          notification.save
        end
      end
    end

    @messages = @trip.messages
    @message = Message.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    authorize @trip
    @message = Message.new(message_params)
    @message.trip = @trip
    @message.user = current_user
    if @message.save
      TripChannel.broadcast_to(
        @trip,
        render_to_string(partial: "message", locals: { message: @message })
      )
      @trip.bookings.where(status: "accepted").each do |booking|
        unless booking.user == @message.user
          Notification.create(content: "New activity in your chatroom", receiver: booking.user, booking: booking, notification_type: "new-chat-activity")
        end
      end
      redirect_to trip_messages_path(@trip, anchor: "message-#{@message.id}")
    else
      render "messages/index"
    end
  end

  def like
    @message = Message.find(params[:id])
    authorize @message

    if current_user.liked? @message
      current_user.unlike @message
    else
      current_user.likes @message
    end

    @likes_counter = @message.get_likes.size
    respond_to do |format|
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
