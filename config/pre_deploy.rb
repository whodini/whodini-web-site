namespace :deploy do

  namespace :pre do
    set :prereq_home, "$WHODINI_HOME/prereq"
    def run_with_init (cmd) 
      run "mkdir -p #{prereq_home}; cd #{prereq_home}; #{cmd}", :shell => :bash
    end

    desc "Pre-requiste for ruby install"
          task :preruby, :roles => :'app' do
                  run "yum remove -y ruby; yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel ;yum install -y libxml2 libxml2-devel libxslt libxslt-devel sqlite-devel;", :shell => :bash   
          end

    desc "Install Environment variables"    
          task :addenv do
                  run "echo -e 'export WHODINI_HOME=\"#{deploy_to}\"\\nexport WHO_LOGS=\"$WHODINI_HOME/logs\"\\nexport MYSQL_BASEDIR=\"$WHODINI_HOME/mysql\"\\nexport PATH=$PATH:$MYSQL_BASEDIR/bin' >> ~/.bashrc", :shell => :bash
    end

    desc "Turn on the insecure mode of the curl"
    task :disablecurlsslval do
      run "echo insecure >> ~/.curlrc", :shell => :bash 
    end

    desc "Pre install"
    task :default do
      disablecurlsslval
      preruby
      updategit
    end

    desc "update git"
    task :updategit do
      run "yum -y update git; rm /etc/my.cnf", :shell => :bash
    end
  end
end
