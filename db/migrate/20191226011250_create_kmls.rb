class CreateKmls < ActiveRecord::Migration[6.0]
  def change
    create_table :kmls do |t|
      t.string :name
      t.string :file
      t.references :hike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
