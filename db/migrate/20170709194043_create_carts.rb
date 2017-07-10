class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :total
      t.references :cart_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
