class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :total_rub
      t.decimal :total_usd
      t.integer :user_id
      t.string :recipient_first_name
      t.string :recipient_middle_name
      t.string :recipient_last_name
      t.string :recipient_email
      t.string :recipient_address
      t.integer :cart_status_id
      t.integer :order_number
      t.boolean :for_yourself, default: false
      t.boolean :as_present, default: false
      t.timestamps null: false
    end
  end
end
