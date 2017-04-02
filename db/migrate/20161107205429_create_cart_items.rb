class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :user_id
      t.integer :pattern_id
      t.integer :strand_id
      t.integer :fabric_id
      t.integer :kit_id
      t.integer :accessory_id
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
