class AdminController < ApplicationController
before_action :admin_check
before_action :notification_filter, only: [:index]

layout "dashboard"

  def index
    @admin_notifications = AdminNotification.where(recipient: current_user).unread
    @carts = Cart.placed
  end

  def discount_category_select
  end

  def discount_patterns
    @patterns = Pattern.all.order(title_ru: :asc)
  end

  def discount_active_patterns
    @patterns = Pattern.discount_active.order(title_ru: :asc)

    render action: :discount_active_patterns
  end

  def no_discount_patterns
    @patterns = Pattern.no_discount.order(title_ru: :asc)

    render action: :no_discount_patterns
  end

  private

  def admin_check
    redirect_to new_user_session_path unless user_signed_in? && current_user.admin?
  end

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
