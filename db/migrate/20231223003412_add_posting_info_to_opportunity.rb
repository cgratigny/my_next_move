class AddPostingInfoToOpportunity < ActiveRecord::Migration[7.1]
  def change
    add_column :opportunities, :posted_on, :string
  end
end
