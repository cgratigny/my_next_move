# == Schema Information
#
# Table name: opportunities
#
#  id          :bigint           not null, primary key
#  applied_on  :date
#  data        :jsonb
#  description :text
#  name        :string
#  pay_maximum :integer
#  pay_minimum :integer
#  pay_period  :string
#  rating      :string
#  state       :string
#  uri         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint
#
# Indexes
#
#  index_opportunities_on_company_id  (company_id)
#

FactoryBot.define do
  factory :opportunity do
    company { build(:company) }
    name { Forgery('name').industry }
  end
end
