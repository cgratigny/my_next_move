class CreateOpportunityMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :opportunity_metrics do |t|
      t.integer :score

      t.references :opportunity
      t.references :metric

      t.jsonb :data, default: {}

      t.timestamps
    end
    add_index :opportunity_metrics, [:opportunity_id, :metric_id], unique: true
  end
end
