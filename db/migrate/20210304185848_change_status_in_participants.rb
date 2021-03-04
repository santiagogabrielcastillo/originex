class ChangeStatusInParticipants < ActiveRecord::Migration[6.0]
  def change
    change_column :participants, :status, 'boolean USING CAST(status AS boolean)'
  end
end
