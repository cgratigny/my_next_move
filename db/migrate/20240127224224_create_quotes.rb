class CreateQuotes < ActiveRecord::Migration[7.1]
  def change
    create_table :quotes do |t|
      t.integer :position
      t.string :name

      t.timestamps
    end
  end
end
