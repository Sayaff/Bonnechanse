class CartsController < ApplicationController
  before_action :set_cart_items
  
  def show
  end

  def confirm_order
  end

  def place_order
  end

private
  def set_cart_items
    @cart_items = current_cart.cart_items.order(:id)
  end

end
