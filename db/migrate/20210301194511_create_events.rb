class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :details
      t.string :status
      t.date :date
      t.references :activities, null: false, foreign_key: true
      t.references :chatrooms, null: false, foreign_key: true

      t.timestamps
    end
  end
end
