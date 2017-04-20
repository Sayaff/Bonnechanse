class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  #prevents error while entering cart which contains already deleted product
  before_action :cart_filter, only: [:index]


    def set_currency
      session[:currency] = params[:currency]
      redirect_to :back
    end

  private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
      {locale: I18n.locale}.merge options
    end

    private
      def cart_filter
        @cart_items = current_user.cart_items
          @cart_items.each do | cart_item |
            if cart_item.product == nil
              cart_item.destroy
              redirect_to :root
            end
          end
      end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :birthday, :email, :password, :password_confirmation, :remember_me)}
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :birthday, :about, :email, :password, :current_password, :remember_me)}
    end
end
