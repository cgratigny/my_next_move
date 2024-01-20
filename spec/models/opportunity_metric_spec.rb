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
require 'rails_helper'

RSpec.describe OpportunityMetric, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end