class DropViewsTable < ActiveRecord::Migration
  def up
    drop_table :views
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
