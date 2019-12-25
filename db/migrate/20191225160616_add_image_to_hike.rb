class AddImageToHike < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :image, :string
  end
end
