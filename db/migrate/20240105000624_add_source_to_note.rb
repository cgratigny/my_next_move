class AddSourceToNote < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :source, :string, default: :user
  end
end
