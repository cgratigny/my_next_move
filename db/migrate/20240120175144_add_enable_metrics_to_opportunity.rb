class AddEnableMetricsToOpportunity < ActiveRecord::Migration[7.1]
  def change
    add_column :opportunities, :metrics_enabled, :boolean, default: false
    add_column :opportunities, :total_score, :integer, default: 0
    add_column :opportunities, :ranking, :integer, default: 0
  end
end
