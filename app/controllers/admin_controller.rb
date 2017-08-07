class AdminController < ApplicationController
before_action :admin_check
before_action :notification_filter, only: [:index]

layout "dashboard"

  def index
    @admin_notifications = AdminNotification.where(recipient: current_user).unread
    @carts = Cart.placed
  end

  private

  def admin_check
    redirect_to new_user_session_path unless user_signed_in? && current_user.admin?
  end

  private
    def notification_filter
      notifications = AdminNotification.where(recipient: current_user)
      if user_signed_in? && current_user.admin?
        notifications.each do | n |
          if n.notifiable == nil
            n.destroy
            render json: { success: true }
          end
        end
      end
    end
end
