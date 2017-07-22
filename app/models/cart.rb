class Cart < ActiveRecord::Base
  belongs_to :cart_status
  belongs_to :user
  has_many :cart_items
  before_create :set_cart_status
  before_save :update_total_rub
  before_save :update_total_usd

  def total_rub
    cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.product.price_rub) : 0 }.sum
  end

  def total_usd
    cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.product.price_usd) : 0 }.sum
  end


private
  def set_cart_status
    self.cart_status_id = 1
  end

  def update_total_rub
    self[:total_rub] = total_rub
  end

  def update_total_usd
    self[:total_usd] = total_usd
  end

end
