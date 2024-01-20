# == Schema Information
#
# Table name: metrics
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  name       :string
#  position   :integer
#  weight     :integer          default(10)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  move_id    :bigint
#
# Indexes
#
#  index_metrics_on_move_id  (move_id)
#
class Metric < ApplicationRecord
  belongs_to :move, counter_cache: true
  has_many :opportunity_metrics

  after_commit on: :create
  before_validation :calculate_position, on: :create

  validates :name, presence: true
  validates :position, numericality: true

  default_scope -> { order(position: :asc) }

  def create_opportunity_metrics
    self.move.opportunities.metrics_enabled.each do |opportunity|
      OpportunityMetric.find_or_create_by(opportunity: opportunity, metric: self)
    end
  end

  def calculate_position
    self.position = self.move.metrics.reorder(position: :desc).first.try(:position).to_i + 1
  end

end
