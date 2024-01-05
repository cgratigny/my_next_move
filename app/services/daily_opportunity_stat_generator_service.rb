class DailyOpportunityStatGeneratorService < ApplicationService
  attr_accessor :date

  def perform
    Move.find_each do |move|
      DailyOpportunityStat.find_or_create_by(move: move, date: self.date).update(
        build_daily_opportunity_stat 
      )
    end
  end

  def build_stat_data
    stats_data = {}
    OpportunityState.each do |state|
      stats_data["#{state.to_s}_count"] = Opportunity.by_state(state.to_s).count
    end
    stats_data
  end

  def build_daily_opportunity_stat
    { stats_data: build_stat_data }
  end
end