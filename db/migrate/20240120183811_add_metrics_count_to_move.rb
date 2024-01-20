class AddMetricsCountToMove < ActiveRecord::Migration[7.1]
  def change
    add_column :moves, :metrics_count, :integer
    add_column :moves, :metrics_total_weight, :integer
  end
end
