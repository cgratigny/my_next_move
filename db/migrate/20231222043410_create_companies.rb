class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies, if_not_exists: true do |t|
      t.string :name
      t.string :uri
      t.string :timestamps

      t.timestamps
    end
  end
end
