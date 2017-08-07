class AdminNotificationsController < ApplicationController
  before_action :admin_check
  before_action :set_admin_notifications, only: [:index, :clear_all, :mark_as_unread]
  before_action :set_admin_notification, only: [:mark_as_read, :destroy]

  layout "dashboard"

  def index
  end

  def mark_as_read
    @admin_notification.update(read_at: Time.zone.now)
    render json: {success: true}
  end


#for test purposes, delete later
  def mark_as_unread
    @admin_notifications.update_all(read_at: nil)
    redirect_to :back
  end

  def destroy
    @admin_notification.destroy
    render json: {success: true}
  end

  def clear_all
    @admin_notifications.destroy_all
    render action: :index
  end

  private
    def set_admin_notifications
      @admin_notifications = AdminNotification.where(recipient: current_user)
    end
    def set_admin_notification
      @admin_notification = AdminNotification.find(params[:id])
    end

end
