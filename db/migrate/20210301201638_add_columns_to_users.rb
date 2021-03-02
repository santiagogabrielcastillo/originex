class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :full_name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :birthday, :date
    add_column :users, :address, :string
  end
end
