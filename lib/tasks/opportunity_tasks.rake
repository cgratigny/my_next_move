namespace :opportunity_tasks do
 
  # Runs the OpportunityAgerService to age opportunities and check in with Honeybadger monitoring
  task :ager => :environment do
    OpportunityAgerService.new.perform
    Honeybadger.check_in('5mIY6L')
  end

 
end
