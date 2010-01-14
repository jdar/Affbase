set :user, 'lifewithoutlimitslabs.org'
set :server, 'lifewithoutlimitslabs.org'
set :application, "Affweb"
set :repository,  "git://github.com/LifeWithoutLimits/Affbase.git"
set :keep_releases, 5
role :web, server
role :app, server
role :db,  server, :primary => true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_to, "/home/#{user}/#{application}" 

task :restart, :roles => :app do
end

after "deploy:update_code", :roles => [:web, :db, :app] do
  run "chmod 755 #{release_path}/public -R" 
end

after "deploy:update", "deploy:cleanup" 