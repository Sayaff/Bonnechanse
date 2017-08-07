class CartsController < ApplicationController
  before_action :set_cart_items
  before_action :set_cart, only: [:cart_info, :switch_to_placed, :switch_to_delivered, :switch_to_cancelled]

  def index
    @carts = Cart.placed
  end

  def show
  end

  def update
   respond_to do |format|
    if current_cart.update(cart_params)
      format.html { redirect_to action: :place_order }
    else
      format.html { redirect_to :back, notice: "Please fill the form" }
    end
   end
  end

  def confirm_order
    @user = current_user
  end

  def place_order
    current_cart.update(cart_status_id: 2)
    if current_cart.for_yourself?
      current_user.update(address: current_cart.recipient_address)
    end
    #removes cart from session after payment and makes sure no cart items left in new cart
    session[:cart_id] = nil
    current_cart.cart_items.destroy_all
  end

  def buy_for_yourself
    current_cart.update(recipient_first_name: current_user.first_name,
    recipient_middle_name: current_user.middle_name,
    recipient_last_name: current_user.last_name,
    recipient_email: current_user.email,
    recipient_address: current_user.address,
    for_yourself: true, as_present: false)
    #binding.pry
  end

  def buy_as_present
    current_cart.update(recipient_first_name: nil,
    recipient_middle_name: nil,
    recipient_last_name: nil,
    recipient_email: nil,
    recipient_address: nil,
    for_yourself: false, as_present: true)
  end

  def my_orders
    @carts = Cart.where(user_id: current_user.id)
  end

  def cart_info
  end

  def switch_to_placed
    @cart.update(cart_status_id: 2)
    redirect_to action: :cart_info
  end

  def switch_to_delivered
    @cart.update(cart_status_id: 3)
    redirect_to action: :cart_info
  end

  def switch_to_cancelled
    @cart.update(cart_status_id: 4)
    redirect_to action: :cart_info
  end

private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def set_cart_items
    @cart_items = current_cart.cart_items.order(:id)
  end

  def cart_params
    params.require(:cart).permit(:recipient_first_name, :recipient_middle_name, :recipient_last_name, :recipient_email, :recipient_address)
  end

end
