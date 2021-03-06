class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:quantity_increase, :quantity_decrease, :destroy]
  respond_to :html, :js
  def index
    @cart_items = current_cart.cart_items
  end
  def create_pattern
    pattern = Pattern.find(params[:id])
    if current_cart.cart_items.where(pattern_id: pattern.id).any?
      cart_item = current_cart.cart_items.find_by(pattern_id: pattern.id)
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_cart.cart_items.create(user_id: current_user.id, pattern_id: pattern.id, quantity: 1)
    end
  end

  def create_strand
    strand = Strand.find(params[:id])
    quantity = params[:quantity] #allows to add more than 1 item at the same time, add for all products exc.patterns
    if current_cart.cart_items.where(strand_id: strand.id).any?
      cart_item = current_cart.cart_items.find_by(strand_id: strand.id)
      cart_item.update(quantity: cart_item.quantity.to_i + quantity.to_i)
    else
      current_cart.cart_items.create(user_id: current_user.id, strand_id: strand.id, quantity: quantity)
    end
  end

  def create_fabric
    fabric = Fabric.find(params[:id])
    if current_cart.cart_items.where(fabric_id: fabric.id).any?
      cart_item = current_cart.cart_items.find_by(fabric_id: fabric.id)
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_cart.cart_items.create(fabric_id: fabric.id, quantity: 1)
  end

  redirect_to :back
  end

  def create_kit
    kit = Kit.find(params[:id])
    if current_cart.cart_items.where(kit_id: kit.id).any?
      cart_item = current_cart.cart_items.find_by(kit_id: kit.id)
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_cart.cart_items.create(kit_id: kit.id, quantity: 1)
  end

  redirect_to action: :index
  end

  def create_accessory
    accessory = Accessory.find(params[:id])
    if current_cart.cart_items.where(accessory_id: accessory.id).any?
      cart_item = current_cart.cart_items.find_by(accessory_id: accessory.id)
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_cart.cart_items.create(accessory_id: accessory.id, quantity: 1)
  end

  redirect_to action: :index
  end

  def clear_cart
    current_cart.cart_items.destroy_all
    redirect_to action: :index
  end

  def quantity_increase
    @cart_item.update(quantity: @cart_item.quantity + 1)
  end

  def quantity_decrease
    @cart_item.update(quantity: @cart_item.quantity - 1) unless
    @cart_item.quantity == 1
  end

  def destroy
    @cart_item.destroy
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end
end
