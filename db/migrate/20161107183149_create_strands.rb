class CreateStrands < ActiveRecord::Migration
  def change
    create_table :strands do |t|
      t.string :title_en
      t.string :title_ru
      t.string :manufacturer
      t.decimal :price_usd
      t.decimal :price_rub
      t.string :color

      t.timestamps null: false
    end
  end
end
