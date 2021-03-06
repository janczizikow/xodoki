class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true
      t.references :hike, foreign_key: true
      t.string :text
      t.string :link

      t.timestamps
    end
  end
end
