set :stage, :staging
set :application, 'myagregat.icfdev.ru'
server 'myagregat.icfdev.ru', user: 'wwwmyagregat', roles: %w{web app db}
set :ssh_options, {
    forward_agent: true,
    port: 226
}
set :rails_env, :staging
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
fetch(:default_env).merge!(rails_env: :staging)
