namespace :daily_stat do
 
  task :generate_daily_opportunity_stat => :environment do
    GenerateDailyOpportunityStatService.new(date: Date.today).perform
  end

 
end
