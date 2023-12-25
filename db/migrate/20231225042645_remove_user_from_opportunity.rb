class RemoveUserFromOpportunity < ActiveRecord::Migration[7.1]
  def change
    remove_column :opportunities, :user_id
  end
end
