# == Schema Information
#
# Table name: daily_opportunity_stats
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  date       :date
#  stats_data :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  move_id    :bigint
#
# Indexes
#
#  index_daily_opportunity_stats_on_move_id           (move_id)
#  index_daily_opportunity_stats_on_move_id_and_date  (move_id,date) UNIQUE
#
FactoryBot.define do
  factory :daily_opportunity_stat do
  end
end
