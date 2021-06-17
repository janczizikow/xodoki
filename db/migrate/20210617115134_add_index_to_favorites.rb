class AddIndexToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_index :favorites, [:hike_id, :user_id], unique: true
  end
end
