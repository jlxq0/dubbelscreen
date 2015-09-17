class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string,                unique: true
    add_column :users, :member, :boolean
    add_column :users, :admin, :boolean
  end
end
