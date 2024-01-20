# == Schema Information
#
# Table name: metrics
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  name       :string
#  position   :integer
#  weight     :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  move_id    :bigint
#
# Indexes
#
#  index_metrics_on_move_id  (move_id)
#
require 'rails_helper'

RSpec.describe Metric, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end