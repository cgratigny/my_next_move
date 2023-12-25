class AddNotesCountToMove < ActiveRecord::Migration[7.1]
  def change
    add_column :moves, :notes_count, :integer
  end
end
