class AddOpportunityCountToCompany < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :opportunity_count, :integer
  end
end
