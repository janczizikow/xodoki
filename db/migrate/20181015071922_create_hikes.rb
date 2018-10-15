class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.references :user, foreign_key: true
      t.string :slug, null: false
      t.string :title
      t.text :description
      t.date :date
      t.string :type

      t.timestamps
    end
    add_index :hikes, :slug, unique: true
  end
end
