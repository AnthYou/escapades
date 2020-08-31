class MessagesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    policy_scope(Message)

    unless current_user.accepted_in?(@trip.id)
      flash[:alert] = "You cannot access to this chatroom."
      return redirect_to trip_path(@trip)
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
      redirect_to trip_messages_path(@trip, anchor: "message-#{@message.id}")
    else
      render "messages/index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
