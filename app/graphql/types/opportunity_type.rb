# frozen_string_literal: true

module Types
  class OpportunityType < Types::BaseObject
    field :id, ID, null: false
    field :uri, String, null: false
    field :name, String, null: false
  end
end
