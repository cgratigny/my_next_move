class CreateTabularData < ActiveRecord::Migration[7.1]
  def change
    create_table :tabular_data do |t|
      t.string :title
      t.integer :position

      t.string :description

      t.timestamps
    end
  end
end
