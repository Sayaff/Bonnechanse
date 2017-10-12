class CreateStrands < ActiveRecord::Migration
  def change
    create_table :strands do |t|
      t.string :title_en
      t.string :title_ru
      t.string :manufacturer
      t.decimal :price_usd
      t.decimal :price_rub
      t.string :color
      t.string :storage_status
      t.integer :storage_quantity
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
