class AddIndexToPagesTitle < ActiveRecord::Migration[6.0]
  def change
    add_index :pages, :title, unique: true
  end
end
