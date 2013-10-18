set :stage, :production
set :application, 'myagregatprod.icfdev.ru'
server 'myagregat.icfdev.ru', user: 'wwwmyagregat', roles: %w{web app db}
set :ssh_options, {
    forward_agent: true,
    port: 226
}
set :rails_env, :production
fetch(:default_env).merge!(rails_env: :production)
