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

require 'rails_helper'

RSpec.describe Opportunity, type: :model do

  describe '#relationships' do
    it 'belongs to a company' do
      company = create(:company)
      opportunity = create(:opportunity, company: company)
      expect(opportunity.company).to eq(company)
    end

    it 'requires an associated company' do
      opportunity = build(:opportunity, company: nil)
      expect(opportunity).to_not be_valid
      expect(opportunity.errors.messages[:company]).to include "must exist"
    end
  end

  describe '#attributes' do
    it 'has a name attribute' do
      opportunity = create(:opportunity, name: 'Software Engineer')
      expect(opportunity.name).to eq('Software Engineer')
    end

    it 'has a state attribute' do
      opportunity = create(:opportunity, state: :withdrawn)
      expect(opportunity.state).to eq(:withdrawn) 
    end

    describe '#state' do
      it 'defaults state to :interested' do
        opp = Opportunity.new
        expect(opp.state).to eq('interested') 
      end

      it 'allows setting state to other OpportunityState values' do
        opp = Opportunity.new(state: :applied)
        expect(opp.state).to eq('applied')
      end
    end
  end

  describe '#rating' do
    it 'defaults rating to :one' do
      opp = Opportunity.new
      expect(opp.rating).to eq('one')
    end

    it 'allows setting rating to other OpportunityRating values' do
      opp = Opportunity.new(rating: :two)
      expect(opp.rating).to eq('two')
    end
  end

end
