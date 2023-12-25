class CreateMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :moves do |t|
      t.string :name
      t.text :description
      t.string :state
      t.references :user
      t.date :starts_on
      t.date :stops_on
      t.date :goal_on

      t.timestamps
    end
  end
end
