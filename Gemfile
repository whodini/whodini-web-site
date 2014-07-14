source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'whodini_main', git: "https://b9baf1fb4e6db4643c1bf43ca9e0fb64a51cb4ff:x-oauth-basic@github.com/whodini/whodini-web-common.git"
# for local development:

# for local development:
# gem 'whodini_main', path: "/Users/timtowles/Projects/whodini-web-common"

# Needs to be outside of assets group because it’s needed in production
# Use a patched version with an updated r.js file
gem 'requirejs-rails', '0.9.1', :git => 'https://github.com/jwhitley/requirejs-rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # Most of these gems help in building UI components quickly, consistiently and in a cross browser way
  # so that we can avoid bloated UI libraries (who's styles must be inefficiently overridden)
  # such as Twitter Bootstrap or Zurb Foundation
  # Compass and sass are at the core of this approach.

  # This gem provides official integration for Ruby on Rails projects with the Sass stylesheet language.
  # https://github.com/rails/sass-rails
  gem 'sass-rails'

  gem "sass", "~> 3.2.13"

  # Compass is an open-source CSS Authoring Framework.
  # https://github.com/Compass/compass-rails
  gem 'compass-rails'

  # Lots of CSS Recipes, made with Compass using Sass. Ready to use.
  # http://compass-recipes.moox.fr/
  gem 'compass-recipes'

  # CoffeeScript adapter for the Rails asset pipeline
  # https://github.com/rails/coffee-rails
  gem 'coffee-rails'

  # Advanced typographic scale
  # https://github.com/Team-Sass/modular-scale
  # gem 'modular-scale'

  # Susy is a responsive grid system
  # Compass is to Susy as Burbon is to Neat.
  # http://susy.oddbird.net/#susy-oddbird-net
  gem 'susy'

  # http://html5boilerplate.com/
  # https://github.com/sporkd/compass-h5bp
  gem 'compass-h5bp'
  gem 'haml-rails'
  gem 'slim-rails'

  # Mixins to write advanced css3 animations
  # https://github.com/ericam/compass-animation
  gem 'animation'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  # Create styleguides for Rails 3.2 projects
  # https://github.com/nadarei/nkss-rails
  gem 'uglifier', '>= 1.0.3'
  gem 'nkss-rails', github: 'nadarei/nkss-rails'
end

gem 'jquery-rails'
# Deploy with Capistrano
gem 'capistrano', '~> 2.15.5'
gem 'cap_git_tools'
gem 'capawsext', '>=0.2'
gem 'fog'
gem 'colored'
gem 'thin'

# To use debugger
# gem 'debugger'
gem 'rvm-capistrano' # Gems for production only

# Hipchat integration gem
gem 'hipchat'

gem 'tilt', '1.3.3'

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
