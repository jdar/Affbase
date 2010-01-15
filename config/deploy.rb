# Developed using docs from http://github.com/leehambley/capistrano-handbook/blob/master/index.markdown


set :user, 'dclark'
set :server, 'lifewithoutlimitslabs.org'
set :application, 'Affbase'
set :repository,  'git@github.com:LifeWithoutLimits/Affbase.git'
set :branch, "master"
set :keep_releases, 5
server 'www.lifewithoutlimitslabs.org', :app, :web, :db
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, "git"
set :git_enable_submodules, 1

namespace :deploy do
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/sensitive.yml #{release_path}/config/sensitive.yml"
  end
  
  desc "Sync the public/assets directory."
  task :assets do
    system "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{application}:#{shared_path}/"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'