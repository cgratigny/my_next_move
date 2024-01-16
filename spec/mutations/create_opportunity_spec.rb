require 'rails_helper'

RSpec.describe Mutations::CreateOpportunity, type: :mutation do
  def perform(args = {})
    described_class.new(object: nil, field: nil, context: {}).resolve(args)
  end

  it 'creates a new opportunity' do
    name = 'New Opportunity'
    uri = 'http://example.com'

    opportunity = perform(name: name, uri: uri)

    expect(opportunity).to be_persisted
    expect(opportunity.name).to eq(name)
    expect(opportunity.uri).to eq(uri)
  end

  it 'requires a uri' do
    expect { perform(name: 'Test') }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
