class AddEnableMetricsToOpportunity < ActiveRecord::Migration[7.1]
  def change
    add_column :opportunities, :metrics_enabled, :boolean, default: false
  end
end
