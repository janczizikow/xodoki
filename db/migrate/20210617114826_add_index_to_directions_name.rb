class AddIndexToDirectionsName < ActiveRecord::Migration[6.0]
  def change
    add_index :directions, :name, unique: true
  end
end
