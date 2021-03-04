class AddCoordinatesToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :latitude, :float
    add_column :events, :longitud, :float
  end
end
