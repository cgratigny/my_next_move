# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  timestamps :string
#  uri        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# spec/models/company_spec.rb

require 'rails_helper'

RSpec.describe Company, type: :model do

  describe '#has_many :opportunities' do
    it 'returns associated opportunities' do
      company = Company.create(name: 'Acme')
      opportunity = company.opportunities.create(name: 'New Opportunity')

      expect(company.opportunities).to include(opportunity) 
    end
  end

end