class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :title_en
      t.string :title_ru
      t.text :description_en
      t.text :description_ru
      t.decimal :price_usd #add precision 10 scale 2 for both prices
      t.decimal :price_rub
      t.string :designer
      t.string :size
      t.string :category
      t.boolean :discount_active, default: false
      t.integer :discount_percentage
      t.date :from_date
      t.date :to_date
      t.decimal :initial_price_rub
      t.decimal :initial_price_usd

      t.timestamps null: false
    end
  end
end
