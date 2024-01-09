# frozen_string_literal: true

class Opportunity::ChooseStateComponent < ApplicationComponent
  attr_reader :opportunity

  def opportunity_state_options
    OpportunityState.all
  end

end
