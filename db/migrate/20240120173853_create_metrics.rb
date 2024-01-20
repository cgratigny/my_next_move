class CreateMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :metrics do |t|
      t.string :name
      t.references :move

      t.integer :position
      t.integer :weight, default: 10

      t.jsonb :data, default: {}

      t.timestamps
    end
  end
end
