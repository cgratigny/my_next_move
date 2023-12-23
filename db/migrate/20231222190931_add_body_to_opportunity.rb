class AddBodyToOpportunity < ActiveRecord::Migration[7.1]
  def change
    add_column :opportunities, :body, :jsonb, default: {}
  end
end
