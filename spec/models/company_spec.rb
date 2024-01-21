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
#  user_id           :bigint
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#

require "rails_helper"

RSpec.describe Company, type: :model do
  describe "#has_many :opportunities" do
    it "returns associated opportunities" do
      company = Company.create(name: "Acme")
      opportunity = company.opportunities.create(name: "New Opportunity")

      expect(company.opportunities).to include(opportunity)
    end
  end
end
