# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

namespace :db do
  desc "build database (drop and create, migrate, seed)"
  task :build => [:drop, :create, :migrate, :seed] do |t|
  end
end


Rails.application.load_tasks
