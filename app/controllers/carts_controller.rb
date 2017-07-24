class CartsController < ApplicationController
  before_action :set_cart_items

  def show
  end

  def confirm_order
    @user = current_user
  end

  def place_order
  end

  def my_orders
    @carts = Cart.where(user_id: current_user.id)
  end

private
  def set_cart_items
    @cart_items = current_cart.cart_items.order(:id)
  end

end
