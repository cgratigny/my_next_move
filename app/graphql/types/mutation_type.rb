# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_opportunity, mutation: Mutations::CreateOpportunity
  end
end
