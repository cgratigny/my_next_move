class CreateDailyOpportunityStats < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_opportunity_stats do |t|
      t.references :move
      t.jsonb :data, default: {}
      t.date :date
      t.jsonb :stats_data, default: {}

      t.timestamps
    end

    # Add a unique index on move and date
    add_index :daily_opportunity_stats, [:move_id, :date], unique: true
  end
end
