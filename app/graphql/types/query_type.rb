# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject

    field :opportunities, [OpportunityType], null: false

    def opportunities
      Opportunity.all
    end

  end
end
