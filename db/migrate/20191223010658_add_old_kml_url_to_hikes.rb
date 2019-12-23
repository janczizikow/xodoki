class AddOldKmlUrlToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :old_kml_url, :string
  end
end
