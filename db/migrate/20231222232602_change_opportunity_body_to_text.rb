class ChangeOpportunityBodyToText < ActiveRecord::Migration[7.1]
  def change
    remove_column :opportunities, :body
    add_column :opportunities, :body, :text
  end
end
