class AddVersionIdToNote < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :version_id, :integer
  end
end
