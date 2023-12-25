class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.jsonb :data, default: {}
      t.string :file
      t.references :user

      t.timestamps
    end
  end
end
