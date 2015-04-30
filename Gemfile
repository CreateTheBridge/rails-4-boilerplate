ruby '2.1.3'
source 'https://rubygems.org'

# Web Server
gem 'unicorn'                       # multi-worker based web server
gem 'foreman'                       # Process runner for unicorn

# DB Provider
gem 'pg'                            # Use postgresql

# Frameworks
gem 'ruby-terminfo'                 # Terminal info
gem 'awesome_print'                 # Print awesomely
gem 'rails'                         # Ruby on Rails
gem 'grape'                         # Web API Framework
gem 'cherry'                        # RESTful API Generation
gem 'rack-contrib'                  # Rack-enabled JSONP support
gem 'rack-cors'                     # Rack-enabled CORS support
gem 'lumberjack'                    # Advanced Logging Utility
gem 'redis-rails'                   # Redis stuff!
gem 'haml-rails'                    # haml templating enginge
gem 'delayed_job_active_record'     # Background job processing framework
gem 'devise'                        # users authentication framework
gem 'rolify'                        # users role management
gem 'cancancan'                     # users permissions
gem 'simple_form'                   # more robust form generation
gem 'browser'                       # user agent detection
gem 'aws-sdk'                       # Direct Uploads to S3
gem 'fog'                           # Asset Managment with S3
gem 'carrierwave'                   # Attachment Management
gem 'carrierwave_backgrounder'      # Async File Processing
gem 'gibbon'                        # MailChimp API
gem 'mandrill-api'                  # Mandrill API
gem 'kaminari'                      # Pagination
gem 'aasm'                          # State machine functionality
gem 'paper_trail'                   # Record versioning functionality


# Front-end Frameworks
gem 'normalize-rails'
gem 'sass-rails', '5.0.0.beta1'     # SASS file compilation
gem 'compass-rails'                 # Compass support
gem 'susy'                          # Susy grids
gem 'coffee-rails'                  # CoffeeScript support
gem 'jquery-rails'                  # jQuery
gem 'font-awesome-sass'             # Font-awesome icon fonts
gem 'ruby-haml-js'                  # haml.js templating engine
gem 'uglifier'                      # Asset minification
gem 'autoprefixer-rails'            # autoprefixes vendor prefixes
gem 'active_link_to'                # Wrapper around link_to
gem 'turbolinks'                    # Async page loading
gem 'jquery-turbolinks'             # Async page loading with javascript
# gem 'ember-rails'                   # Rails gem for Ember Applications
# gem 'ember-source'                  # Ember source



group :development do
  gem 'bullet'                      # Monitoring for N+1 queries
  gem 'brakeman'                    # Security vulnerability scanner
  gem 'erb2haml'                    # Easy conversion from erb2haml
  gem 'pry-rails'                   # Replace IRB with Pry
  gem 'git-deploy'                  # Easy deployment
  gem 'quiet_assets'                # Remove asset errors from the console
  gem 'better_errors'               # Show errors in a better man7or
  gem 'binding_of_caller'           # Deeper stack traces for errors
  gem 'interface', :git => 'https://github.com/CreateTheBridge/Interface.git'
end

# Development and Testing assets
group :development, :test do
  gem 'spring'                      # App Preload
  gem 'capybara'                    # functional web interaction testing framework
  gem 'rspec-rails'                 # functional test framework
  gem 'dotenv-rails'                # Environment variable management
  gem 'database_cleaner'            # cleans test database
  gem 'selenium-webdriver'          # JavaScript & integration testing automation
  gem 'factory_girl_rails'          # test factory creation
end

# Production assets
group :production do
  gem 'newrelic_rpm'                # Real-time analytics on application performance
  gem 'unicorn-worker-killer'       # Kill workers when they get stupid
end


# @TODO: Include your own gem




