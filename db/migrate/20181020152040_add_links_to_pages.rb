class AddLinksToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :in_header, :boolean
    add_column :pages, :in_footer, :boolean
  end
end
