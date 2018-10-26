class AddCategoryAndDirectionToHikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :hikes, :category, foreign_key: true
    add_reference :hikes, :direction, foreign_key: true
  end
end
