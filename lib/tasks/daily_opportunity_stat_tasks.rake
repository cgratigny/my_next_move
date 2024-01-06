namespace :daily_opportunity_stat_tasks do
  task generate_daily_opportunity_stat: :environment do
    DailyOpportunityStatGeneratorService.new(date: Date.today).perform
    Honeybadger.check_in("VBIjEp")
  end
end
