class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :title_en
      t.string :title_ru
      t.text :description_en
      t.text :description_ru
      t.decimal :price_usd
      t.decimal :price_rub
      t.string :designer
      t.string :size
      t.string :category

      t.timestamps null: false
    end
  end
end
