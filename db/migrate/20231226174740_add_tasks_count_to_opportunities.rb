class AddTasksCountToOpportunities < ActiveRecord::Migration[7.1]
  def change
    add_column :opportunities, :tasks_count, :integer
  end
end
