# == Schema Information
#
# Table name: opportunities
#
#  id         :bigint           not null, primary key
#  applied_at :datetime
#  data       :jsonb
#  name       :string
#  rating     :string
#  state      :string
#  uri        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_opportunities_on_company_id  (company_id)
#
class Opportunity < ApplicationRecord
  belongs_to :company

  accepts_nested_attributes_for :company

  classy_enum_attr :state, enum: "OpportunityState", default: :interested
  classy_enum_attr :rating, enum: "OpportunityRating", default: :one
  
  validates :uri, url: { allow_nil: true, allow_blank: true }
  
end
