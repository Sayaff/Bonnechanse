class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
  belongs_to :pattern
  belongs_to :strand
  belongs_to :fabric
  belongs_to :kit
  belongs_to :accessory

  def product
    if self.pattern_id.present?
      Pattern.find_by(id: self.pattern_id)
    elsif self.strand_id.present?
      Strand.find_by(id: self.strand_id)
    elsif self.fabric_id.present?
      Fabric.find_by(id: self.fabric_id)
    elsif self.kit_id.present?
      Kit.find_by(id: self.kit_id)
    elsif self.accessory_id.present?
      Accessory.find_by(id: self.accessory_id)
    end
  end

  def product_title
    if I18n.locale == "en"
      self.product.title_en
    else
      self.product.title_ru
    end
  end

  def product_price_rub
    self.product.price_rub * self.quantity
  end

  def product_price_usd
    self.product.price_usd * self.quantity
  end

  def category
    if self.pattern_id.present?
      I18n.t 'activerecord.models.cart_item.pattern'
    elsif self.strand_id.present?
      I18n.t 'activerecord.models.cart_item.thread'
    elsif self.fabric_id.present?
      I18n.t 'activerecord.models.cart_item.fabric'
    elsif self.kit_id.present?
      I18n.t 'activerecord.models.cart_item.kit'
    elsif self.accessory_id.present?
      I18n.t 'activerecord.models.cart_item.accessory'
    end
  end
end
