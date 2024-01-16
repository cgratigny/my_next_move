module Mutations
  class CreateOpportunity < BaseMutation
    # arguments passed to the `resolve` method
    argument :name, String, required: false
    argument :uri, String, required: true

    # return type from the mutation
    type Types::OpportunityType

    def resolve(name: nil, uri: nil)
      Opportunity.create!(
        name: name,
        uri: uri,
      )
    end
  end
end