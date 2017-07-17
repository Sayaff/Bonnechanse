class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :total
      t.integer :cart_status_id
      t.timestamps null: false
    end
  end
end
