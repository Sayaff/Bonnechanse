class Strand < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title_en, :title_ru, :manufacturer, :price_usd, :price_rub, :color, presence: true
end
