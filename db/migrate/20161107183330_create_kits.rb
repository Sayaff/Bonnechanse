class CreateKits < ActiveRecord::Migration
  def change
    create_table :kits do |t|
      t.string :title
      t.string :containment
      t.decimal :price_usd
      t.decimal :price_rub
      t.text :description

      t.timestamps null: false
    end
  end
end
