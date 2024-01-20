# == Schema Information
#
# Table name: opportunities
#
#  id              :bigint           not null, primary key
#  applied_on      :date
#  data            :jsonb
#  metrics_enabled :boolean          default(FALSE)
#  name            :string
#  notes_count     :integer
#  pay_maximum     :integer
#  pay_minimum     :integer
#  pay_period      :string
#  ranking         :integer          default(0)
#  rating          :string
#  state           :string
#  tags            :string
#  tags_string     :string
#  tasks_count     :integer
#  total_score     :integer          default(0)
#  uri             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint
#  move_id         :bigint
#
# Indexes
#
#  index_opportunities_on_company_id  (company_id)
#  index_opportunities_on_move_id     (move_id)
#

FactoryBot.define do
  factory :opportunity do
    company { build(:company) }
    name { Forgery("name").industry }
  end
end
