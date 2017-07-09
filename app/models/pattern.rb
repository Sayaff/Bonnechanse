class Pattern < ActiveRecord::Base
  has_many :users
  has_many :cart_items 

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title_en, :title_ru, :description_en, :description_ru, :price_usd, :price_rub, :designer, :size, :category, presence: true

  def human_attribute_name(*args)
    self.class.human_attribute_name(*args)
  end

  scope :by_date, ->{ order("created_at DESC")}
  scope :price_roubles, ->{ order(price_rub: :desc)}
  scope :price_dollars, ->{ order(price_usd: :desc)}
  scope :scenery, ->{ where(category: ['Scenery', 'Пейзаж'])}
  scope :portrait, ->{ where(category: ['Portrait', 'Портрет'])}
  scope :genre_scene, ->{ where(category: ['Жанровая сцена', 'Genre Scene'])}
  scope :still_life, ->{ where(category: ['Натюрморт', 'Still life'])}
end
