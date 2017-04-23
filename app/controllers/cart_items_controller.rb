class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_user.cart_items
  end

  def create_pattern
    pattern = Pattern.find(params[:id])
    if current_user.cart_items.where(pattern_id: pattern.id).any?
      cart_item = current_user.cart_items.find_by(pattern_id: pattern.id)
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_user.cart_items.create(pattern_id: pattern.id, quantity: 1)
  end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
end

  def create_strand
    strand = Strand.find(params[:id])
    if current_user.cart_items.where(strand_id: strand.id).any?
      cart_item = current_user.cart_items.find_by(strand_id: strand.id)
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_user.cart_items.create(strand_id: strand.id, quantity: 1)
  end

  redirect_to action: :index
  end

  def create_fabric
    fabric = Fabric.find(params[:id])
    if current_user.cart_items.where(fabric_id: fabric.id).any?
      cart_item = current_user.cart_items.find_by(fabric_id: fabric.id)
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_user.cart_items.create(fabric_id: fabric.id, quantity: 1)
  end

  redirect_to action: :index
  end

  def create_kit
    kit = Kit.find(params[:id])
    if current_user.cart_items.where(kit_id: kit.id).any?
      cart_item = current_user.cart_items.find_by(kit_id: kit.id)
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_user.cart_items.create(kit_id: kit.id, quantity: 1)
  end

  redirect_to action: :index
  end

  def create_accessory
    accessory = Accessory.find(params[:id])
    if current_user.cart_items.where(accessory_id: accessory.id).any?
      cart_item = current_user.cart_items.find_by(accessory_id: accessory.id)
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_user.cart_items.create(accessory_id: accessory.id, quantity: 1)
  end

  redirect_to action: :index
  end

  def clear_cart
    current_user.cart_items.destroy_all
    redirect_to action: :index
  end

  def quantity_increase
    @cart_item = CartItem.find(params[:id])
      @cart_item.update(quantity: @cart_item.quantity + 1)
      respond_to do |format|
        format.js
      end
  end

  def quantity_decrease
    @cart_item = CartItem.find(params[:id])
      @cart_item.update(quantity: @cart_item.quantity - 1) unless
      @cart_item.quantity == 1
      respond_to do |format|
        format.js
      end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to action: :index
  end

end
