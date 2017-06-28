class AdminController < ApplicationController
before_action :admin_check
before_action :notification_filter, only: [:index]

layout "dashboard"

  def index
    @admin_notifications = AdminNotification.where(recipient: current_user).unread
  end

  private

  def admin_check
    redirect_to new_user_session_path unless user_signed_in? && current_user.admin?
  end

  private
    def notification_filter
      if user_signed_in? && current_user.admin?
        @notifications = AdminNotification.where(recipient: current_user)
          @notifications.each do | notification |
            if notification.notifiable == nil
              notification.destroy
              redirect_to :root
            end
          end
        end
    end
end
