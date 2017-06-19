class AdminNotificationsController < ApplicationController
  before_action :admin_check

  def index
    @admin_notifications = AdminNotification.where(recipient: current_user).unread
  end

  def mark_as_read
    @admin_notification = AdminNotification.find(params[:id])
    @admin_notification.update(read_at: Time.zone.now)
    render json: {success: true}
  end

end
