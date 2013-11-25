require 'capistrano'
set :env, "production"
set :bundle_without, [:deployment, :test]
set :rails_env, fetch(:env)
set :thin_port, 80
