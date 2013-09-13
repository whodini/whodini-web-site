set :application, "Whodini-corporate"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
#
set :deploy_to, "/opt/whodini"
ssh_options[:keys] = [File.join(ENV["HOME"],".ssh","devinlogy.pem")]
require 'cap_git_tools/tasks'
#Add groups and server info from the AWS
require 'capawsext/tasks'
require 'capawsext/whoec2helper'
#All commands are executing in the context of this region only.
set :aws_region, 'us-west-1'
add_groups(fetch(:aws_region))

#http://gembundler.com/v1.3/deploying.html
require 'bundler/capistrano'

#https://help.github.com/articles/deploying-with-capistrano
set :user, "root"
default_run_options[:pty] = true
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache
set :repository,  "https://b9baf1fb4e6db4643c1bf43ca9e0fb64a51cb4ff:x-oauth-basic@github.com/whodini/whodini-web-site.git"

set :rvm_ruby_string, "2.0.0"               # use the same ruby as used locally for deployment
set :rvm_autolibs_flag, :fail        # more info: rvm help autolibs

before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, OR:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset

require "rvm/capistrano"
set :ec2_helper, Ec2Helper.new(fetch(:aws_region))

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:update", "deploy:dbcreate"
after "deploy:restart", "deploy:cleanup"

namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end

	desc "Start the thin process"
	task :start, :roles => :'app' do
		run_thin_cmd("start")
	end

	desc "Stop the thin process"
	task :stop, :roles => :'app' do
		run_thin_cmd("stop")
	end

	desc "Restart the thin process"
	task :restart, :roles => :'app'  do
		run_thin_cmd("restart")
	end

  desc "Create dummy db"
  task :dbcreate, :roles => :'app'  do
    run_remote_rake("db:create")
  end

	def run_thin_cmd(command)
		run wrapin_bundle_command("thin #{command} -p 80 -d -e #{fetch(:env)}")
	end

end

 #Define the helpers method
def wrapin_bundle_command(command)
  "cd #{fetch(:current_path)} && RAILS_ENV=\"#{fetch(:env)}\" bundle exec #{command}"
end
def run_remote_rake(rake_cmd)
	rake_args = ENV['RAKE_ARGS'].to_s.split(',')
	cmd = "cd #{fetch(:current_path)} && #{fetch(:rake, "rake")} RAILS_ENV=#{env} #{rake_cmd}"
	cmd += "['#{rake_args.join("','")}']" unless rake_args.empty?
	run cmd
	set :rakefile, nil if exists?(:rakefile)
end

