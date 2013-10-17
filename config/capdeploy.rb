set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

#Приложение
set :application, 'app'

#Репозиторий
set :scm, :git
set :repository,  'git@github.com:BrandyMint/'
set :deploy_via, :remote_cache
#set :git_enable_submodules, 1
ssh_options[:forward_agent] = true

#Учетные данные на сервере
set :user,      'www'
set :deploy_to,  defer { "/home/#{user}/#{application}" }
set :use_sudo,   false

#Все остальное
set :keep_releases, 3

set :rbenv_ruby_version, "2.0.0-p247"
set :bundle_flags, "--deployment --quiet --binstubs"

before 'deploy:restart', 'deploy:migrate'
after 'deploy:restart', "deploy:cleanup"

load 'deploy/assets'
require 'airbrake/capistrano'
require "bundler/capistrano"
require "capistrano-rbenv"
require 'holepicker/capistrano'
require "recipes0/database_yml"
require "recipes0/db/pg"
require "recipes0/init_d/unicorn"
require "recipes0/nginx"
