class DailyOpportunityStatsController < ApplicationController
  before_action :build_current_daily_opportunity_stat, only: [:index]

  # GET /daily_opportunity_stats or /daily_opportunity_stats.json
  def index
    @daily_opportunity_stats = DailyOpportunityStat.order(date: :desc)
  end

  private

  def build_current_daily_opportunity_stat
    @current_daily_opportunity_stat = DailyOpportunityStat.new(DailyOpportunityStatGeneratorService.new(date: Date.today).build_daily_opportunity_stat)
  end
end
