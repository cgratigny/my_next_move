class AddNotesCountToOpportunity < ActiveRecord::Migration[7.1]
  def change
    add_column :opportunities, :notes_count, :integer
  end
end
