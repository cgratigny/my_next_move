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
class Task < ApplicationRecord
  belongs_to :taskable, polymorphic: true, counter_cache: true
  has_many :notes, as: :notable

  has_rich_text :body

  classy_enum_attr :state, enum: "TaskState", default: :todo

  validates :due_date, presence: true

  scope :todo, -> { where.not(state: :complete) }
  scope :chronological, -> { order(due_date: :asc) }

  def short_name
    self.name
  end

  def to_s
    self.name
  end

  def due_today?
    Time.zone.now.to_date == self.due_date
  end

  def past_due?
    Time.zone.now.to_date > self.due_date
  end
end
