require 'hipchat/capistrano'
set :hipchat_send_notification, true
set :hipchat_token, "e1daf8836fed69949b7d9ea31323ad"
set :hipchat_room_name, "Dev Room"
set :hipchat_announce, false # notify users?
set :hipchat_color, 'green' #finished deployment message color
set :hipchat_failed_color, 'red' #cancelled deployment message color
set :hipchat_deploy_user, 'Capistrano'

set :application, "whodini-corp"

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
set :whodini_home, "/opt/whodini"
set :deploy_to, "#{whodini_home}/#{application}"
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

set :ec2_helper, Ec2Helper.new(fetch(:aws_region))

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:update", "deploy:dbcreate"
after "deploy:restart", "deploy:cleanup"

# Report the deployment progress on hipchat
after  "deploy:dbcreate", "hipchat:notify_deploy_finished"


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
		run wrapin_bundle_command("thin #{command} -p #{thin_port} -d -e #{fetch(:env)}")
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

