namespace :deploy do
 
  task :notify => :environment do
    Honeybadger.track_deployment(
      environment: Rails.env,
      revision: `git rev-parse HEAD`.strip,
      local_username: `whoami`.strip,
      repository: "https://github.com/cgratigny/my_next_move"
    )
  end

 
end
