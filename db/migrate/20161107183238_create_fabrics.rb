class CreateFabrics < ActiveRecord::Migration
  def change
    create_table :fabrics do |t|
      t.string :title
      t.string :manufacturer
      t.string :color
      t.decimal :price_usd
      t.decimal :price_rub
      t.string :size

      t.timestamps null: false
    end
  end
end
