class AddObjectChangesToPaperTrail < ActiveRecord::Migration[7.1]
  def change
    add_column :versions, :object_changes, :jsonb
    rename_column :versions, :object, :old_object
    add_column :versions, :object, :jsonb
  end
end
