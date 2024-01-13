class RemoveBodyFromOpportunity < ActiveRecord::Migration[7.1]
  def change
    remove_column :opportunities, :description
    remove_column :opportunities, :posted_on
    remove_column :opportunities, :body
  end
end
