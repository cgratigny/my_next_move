# == Schema Information
#
# Table name: opportunity_metrics
#
#  id             :bigint           not null, primary key
#  data           :jsonb
#  score          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  metric_id      :bigint
#  opportunity_id :bigint
#
# Indexes
#
#  index_opportunity_metrics_on_metric_id                     (metric_id)
#  index_opportunity_metrics_on_opportunity_id                (opportunity_id)
#  index_opportunity_metrics_on_opportunity_id_and_metric_id  (opportunity_id,metric_id) UNIQUE
#
class OpportunityMetric < ApplicationRecord
  belongs_to :metric
  belongs_to :opportunity

  after_commit :update_opportunity_total_score

  validates :metric_id, uniqueness: { scope: :opportunity_id,
    message: "and opportunity must be unique" }


  def update_opportunity_total_score
    return unless self.previous_changes["score"].present?

    opportunity.calculate_score!
    opportunity.calculate_opportunity_ranking
  end

  def calculated_score
    (score.to_i * metric.weight.to_i)
  end
end
