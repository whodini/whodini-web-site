source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'whodini_main', git: "https://b869b554d0672dd43377a32d9ec89ada0ce1da6b:x-oauth-basic@github.com/whodini/whodini-web-common.git"
# for local development:

# for local development:
# gem 'whodini_main', path: "/Users/timtowles/Projects/whodini-web-common"

# Needs to be outside of assets group because it’s needed in production
# Use a patched version with an updated r.js file
gem 'requirejs-rails', '0.9.1', :git => 'https://github.com/jwhitley/requirejs-rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'compass-recipes'
  gem 'modular-scale'
  gem 'susy' #robust grid system: http://susy.oddbird.net/#susy-oddbird-net
  gem 'compass-h5bp'
  gem 'haml-rails'
  gem 'slim-rails'

  gem 'animation'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'nkss-rails', github: 'nadarei/nkss-rails'
end

gem 'jquery-rails'
# Deploy with Capistrano
gem 'capistrano'
gem 'cap_git_tools'
gem 'capawsext', '>=0.2'
gem 'fog'
gem 'colored'
gem 'thin'

	# To use debugger
	# gem 'debugger'
	gem 'rvm-capistrano' # Gems for production only


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
