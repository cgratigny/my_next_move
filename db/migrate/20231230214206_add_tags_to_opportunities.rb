class AddTagsToOpportunities < ActiveRecord::Migration[7.1]
  def change
    add_column :opportunities, :tags, :string
    add_column :opportunities, :tags_string, :string
  end
end
