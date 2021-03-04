class ChangeDescriptionInChatrooms < ActiveRecord::Migration[6.0]
  def change
    change_column :chatrooms, :description, :text
  end
end
