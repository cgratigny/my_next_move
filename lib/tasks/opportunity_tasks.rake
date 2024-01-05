namespace :opportunity_tasks do
 
  task :ager => :environment do
    OpportunityAgerService.new.perform
  end

 
end
