class AddIndexesForQueryOptimization < ActiveRecord::Migration[7.2]
  # Build indexes without locking writes on a live table (PostgreSQL). Concurrent index
  # creation cannot run inside a transaction, so keep this line if you use `algorithm:`.
  disable_ddl_transaction!

  def change
    # Page.included_in_header / Page.included_in_footer filter on `= true` on every page render.
    # Partial indexes match that filter exactly; a plain boolean index would rarely be used.
    add_index :pages, :in_header, where: 'in_header', algorithm: :concurrently, if_not_exists: true
    add_index :pages, :in_footer, where: 'in_footer', algorithm: :concurrently, if_not_exists: true
  end
end
