# == Schema Information
#
# Table name: companies
#
#  id                :bigint           not null, primary key
#  name              :string
#  opportunity_count :integer
#  timestamps        :string
#  uri               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :company do
    name { Forgery('name').company_name }
  end
end
