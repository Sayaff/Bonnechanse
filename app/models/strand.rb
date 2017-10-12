class Strand < ActiveRecord::Base
  has_many :users
  has_many :cart_items, as: :purchaseable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title_en, :title_ru, :manufacturer, :price_usd, :price_rub, :color, presence: true
  validates :discount_percentage, presence: true, if: :validate_discount?

  def validate_discount?
    self.discount_active == true
  end

  def strand_fresh
    self.created_at >= 1.week.ago
  end

  scope :by_date, ->{ order("created_at DESC")}
  scope :price_roubles, ->{ order(price_rub: :desc)}
  scope :price_dollars, ->{ order(price_usd: :desc)}
  scope :discount_active, ->{ where(discount_active: true)}
  scope :no_discount, ->{ where(discount_active: false)}

end
