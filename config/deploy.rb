# Developed using docs from http://github.com/leehambley/capistrano-handbook/blob/master/index.markdown


set :user, 'dclark'
set :server, 'lifewithoutlimitslabs.org'
set :application, 'Affbase'
set :repository,  'git@github.com:LifeWithoutLimits/Affbase.git'
set :keep_releases, 5
server 'www.lifewithoutlimitslabs.org', :app, :web, :db
# 
# role :web, "www.lifewithoutlimitslabs.org"
# role :app, "www.lifewithoutlimitslabs.org"
# role :db,  "www.lifewithoutlimitslabs.org", :primary => true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
# set :deploy_to, "/var/#{application}"
