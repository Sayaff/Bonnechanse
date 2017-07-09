class CreateCartStatuses < ActiveRecord::Migration
  def change
    create_table :cart_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
