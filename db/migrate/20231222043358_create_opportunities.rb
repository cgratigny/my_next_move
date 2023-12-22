class CreateOpportunities < ActiveRecord::Migration[7.1]
  def change
    create_table :opportunities, if_not_exists: true do |t|
      t.string :name
      t.string :uri
      t.jsonb :data, default: {}
      t.string :state
      t.string :rating
      t.references :company
    
      t.timestamp :applied_at
    
      t.timestamps
    end
  end
end
