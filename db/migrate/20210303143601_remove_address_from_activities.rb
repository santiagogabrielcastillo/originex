class RemoveAddressFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :address, :string
  end
end
