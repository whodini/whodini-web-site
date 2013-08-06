require 'capistrano'
set :env, "aws_dev" 
set :bundle_without, [:deployment, :test]
set :rails_env, fetch(:env)

