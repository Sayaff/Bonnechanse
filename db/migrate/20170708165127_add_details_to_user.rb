class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about, :text
    add_column :users, :birthday, :date
    add_column :users, :address, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :terms, :boolean, default: false
  end
end
