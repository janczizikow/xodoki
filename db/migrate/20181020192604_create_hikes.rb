class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.string :slug
      t.date :date
      t.integer :distance

      t.timestamps
    end
    add_index :hikes, :slug, unique: true
  end
end
