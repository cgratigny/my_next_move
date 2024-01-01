class GenerateDailyOpportunityStatService < ApplicationService
  include ActiveModel::Model

  attr_accessor :date

  def perform
    Move.find_each do |move|
      stats_data = {}
      OpportunityState.each do |state|
        stats_data["#{state.to_s}_count"] = Opportunity.by_state(state.to_s).count
      end
      DailyOpportunityStat.find_or_create_by(move: move, date: self.date).update(
        stats_data: stats_data
      )
    end
  end
end