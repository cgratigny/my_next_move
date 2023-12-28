class AddNotesCountToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :notes_count, :integer
  end
end
