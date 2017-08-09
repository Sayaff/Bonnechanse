class Cart < ActiveRecord::Base
  belongs_to :cart_status
  belongs_to :user
  has_many :cart_items
  before_create :set_cart_status
  before_save :update_total_rub
  before_save :update_total_usd
  #allows to validate user details on order placement, not on account registration/update
  with_options if: :place_order_validation do |p|
    p.validates :recipient_first_name, presence: true
  end
  #validates postal address only if shipping is required (in patterns' case it's not)
  with_options if: -> { place_order_validation && shipping_needed? } do |p|
    p.validates :recipient_address, presence: true
  end

  scope :placed, ->{ where.not(cart_status_id: 1) } #id: 1 means "not confirmed yet", no need for this in order management

  def total_rub
    cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.product.price_rub) : 0 }.sum
  end

  def total_usd
    cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.product.price_usd) : 0 }.sum
  end

  def place_order_validation
    self[:for_yourself] || self[:as_present]
  end

  def shipping_needed?
    self.cart_items.where(pattern_id: nil).any?
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
