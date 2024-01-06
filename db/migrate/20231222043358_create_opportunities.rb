class CreateOpportunities < ActiveRecord::Migration[7.1]
  def change
    create_table :opportunities, if_not_exists: true do |t|
      t.string :name
      t.string :uri
      t.jsonb :data, default: {}
      t.string :state
      t.string :rating
      t.integer :pay_minimum
      t.integer :pay_maximum
      t.string :pay_period
      t.text :description
      t.references :company

      t.date :applied_on

      t.timestamps
    end
  end
end
