class CartItem < ActiveRecord::Base
  has_many :patterns
  has_many :strands
  has_many :fabrics
  has_many :kits
  has_many :accessories
  belongs_to :user
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
  def category
    if self.pattern_id.present?
      I18n.t 'activerecord.models.cart_items.pattern'
    elsif self.strand_id.present?
      I18n.t 'activerecord.models.cart_items.thread'
    elsif self.fabric_id.present?
      I18n.t 'activerecord.models.cart_items.fabric'
    elsif self.kit_id.present?
      I18n.t 'activerecord.models.cart_items.kit'
    elsif self.accessory_id.present?
      I18n.t 'activerecord.models.cart_items.accessory'
    end
  end
end
