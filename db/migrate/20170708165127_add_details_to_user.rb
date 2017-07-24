class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about, :text
    add_column :users, :birthday, :date
    add_column :users, :admin, :boolean, default: false
    add_column :users, :terms, :boolean, default: false
    add_column :users, :postal_code, :integer
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
  end
end
