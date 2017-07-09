class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      t.references :cart_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
