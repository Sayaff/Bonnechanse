class Pattern < ActiveRecord::Base
  has_many :users
  has_many :cart_items

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title_en, :title_ru, :description_en, :description_ru, :price_usd, :price_rub, :designer, :size, :category, presence: true
  validates :discount_percentage, presence: true, if: :validate_discount?

  def validate_discount?
    self.discount_active == true
  end

  def human_attribute_name(*args)
    self.class.human_attribute_name(*args)
  end

  def pattern_fresh
    self.created_at >= 1.week.ago
  end

  scope :by_date, ->{ order("created_at DESC")}
  scope :price_roubles, ->{ order(price_rub: :desc)}
  scope :price_dollars, ->{ order(price_usd: :desc)}
  scope :scenery, ->{ where(category: ['Scenery', 'Пейзаж'])}
  scope :portrait, ->{ where(category: ['Portrait', 'Портрет'])}
  scope :genre_scene, ->{ where(category: ['Жанровая сцена', 'Genre Scene'])}
  scope :still_life, ->{ where(category: ['Натюрморт', 'Still life'])}
  scope :discount_active, ->{ where(discount_active: true)}
  scope :no_discount, ->{ where(discount_active: false)}
  scope :fresh, ->{ where("created_at >= ?", 1.week.ago)} #change time period if required
end
