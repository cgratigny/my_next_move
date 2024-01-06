# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  body          :string
#  data          :jsonb
#  description   :text
#  due_date      :date
#  name          :string
#  notes_count   :integer
#  state         :string
#  taskable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  taskable_id   :bigint
#
# Indexes
#
#  index_tasks_on_taskable  (taskable_type,taskable_id)
#
require "rails_helper"

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
