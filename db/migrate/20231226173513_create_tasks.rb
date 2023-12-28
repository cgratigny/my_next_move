class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :taskable, polymorphic: true
      t.date :due_date
      t.string :name
      t.string :body
      t.string :state
      t.text :description

      t.jsonb :data, default: {}
      t.timestamps
    end
  end
end
