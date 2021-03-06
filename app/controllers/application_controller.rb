class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  #prevents error occured after entering cart which contained already deleted product - see :33
  before_action :cart_filter, only: [:index]
  before_action :active_discounts_check
  helper_method :current_cart

    def set_currency
      session[:currency] = params[:currency]
      redirect_to :back
    end

    def current_cart
       order_number = (45..5000).to_a.shuffle
       Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
       cart = Cart.create(user_id: current_user.id, order_number: order_number.pop) #cart_id for admins, order_number for users, .pop takes care of uniqueness
       session[:cart_id] = cart.id
       cart
    end

private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
      {locale: I18n.locale}.merge options
    end

    def cart_filter #deprecated, re-write later
      if user_signed_in?
        @cart_items = current_user.cart_items
          @cart_items.each do | cart_item |
            if cart_item.product == nil
              cart_item.destroy
            end
          end
        end
    end

    def admin_check #check if user is admin in selected actions in products controllers and admin dashboard
      redirect_to new_user_session_path unless user_signed_in? && current_user.admin?
    end

    def active_discounts_check
      @patterns = Pattern.discount_active
      @strands = Strand.discount_active
      @patterns.each do |pattern|
        if pattern.to_date == Date.today
          pattern.update(discount_active: false, discount_percentage: nil, price_rub: pattern.initial_price_rub, price_usd: pattern.initial_price_usd, from_date: nil, to_date: nil)
        end
      end
      @strands.each do |strand|
        if strand.to_date == Date.today
          strand.update(discount_active: false, discount_percentage: nil, price_rub: strand.initial_price_rub, price_usd: strand.initial_price_usd, from_date: nil, to_date: nil)
        end
      end
    end

protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :birthday, :about, :email, :terms, :password, :password_confirmation, :remember_me)}
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :birthday, :about, :email, :password, :current_password, :remember_me)}
    end
end
