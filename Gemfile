source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
#START:mysql
group :production do
  gem 'mysql2'
end
#END:mysql


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',  "  ~> 3.1.0"
  gem 'coffee-rails',  "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
#START_HIGHLIGHT
gem 'capistrano'
#END_HIGHLIGHT

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rspec-rails'
end
gem 'will_paginate', '~> 3.0'
