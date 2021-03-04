class ChangeDetailFromEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :details, :text
  end
end
