require 'capistrano'
set :env, "production"
set :bundle_without, [:deployment, :test]
set :rails_env, fetch(:env)

