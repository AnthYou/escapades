class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification.where(receiver: current_user, read: false))
  end

  def notification_read
    @notification = Notification.find(params[:id])
    authorize @notification
    @notification.read = true
    @notification.save
  end
end
