class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :full_name, :string
    add_column :users, :biography, :text
    add_column :users, :profile_picture, :string 
    add_column :users, :phone, :string
    add_column :users, :street1, :string
    add_column :users, :street2, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string

  end
end