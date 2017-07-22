class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :total_rub
      t.decimal :total_usd
      t.integer :user_id
      t.integer :cart_status_id
      t.integer :order_number
      t.timestamps null: false
    end
  end
end
