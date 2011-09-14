namespace :app do
  
  desc: "reset the app data"
  task :reset => ["db:drop", "db:create", "db:migrate" ]
  
end
