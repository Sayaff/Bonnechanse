class AddDiscountsToPattern < ActiveRecord::Migration
  def change
    add_column :patterns, :discount_active, :boolean, default: false
    add_column :patterns, :discount_percentage, :integer
    add_column :patterns, :from_date, :date
    add_column :patterns, :to_date, :date
    #contain prices before discount, to restore them when discount is cancelled
    add_column :patterns, :initial_price_rub, :decimal
    add_column :patterns, :initial_price_usd, :decimal
  end
end
