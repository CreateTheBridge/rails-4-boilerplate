## Shift - A pivot to the application generation paradigm.

The concept of Shift is to revolutionize the application setup and development lifecycle by providing a robust mix of pre-configured assets and tool sets in an easy to use package.

#### Usage

Follow these steps to create a new project and get up and going in a matter of minutes.

**Clone the Shift project.**
```
> git clone https://github.com/CreateTheBridge/Shift <ENTER NEW APPLICATION NAME (WITHOUT SPACES)>
```
**Create a copy of the .env.template file and rename it to .env to manage your environment variables.**
```
> cp .env.template .env
```
**Update the .env file with the appropriate information for the new application.**
```ruby
# Example .env file content
# Web server config
MAX_WORKER_PROCESSES=3
MIN_WORKER_MEMORY=251658240
MAX_WORKER_MEMORY=272629760

# Redis config
REDIS_URI=redis://localhost:6379

# Database config
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_USER=joshuat
DATABASE_PASSWORD=mangos
DATABASE_NAME=app_template

# Email configuration
MANDRILL_API_KEY=<key>
MANDRILL_EMAIL_TEMPLATE=<template>
EMAIL_FROM_NAME=<name>
EMAIL_FROM_ADDRESS=<address>
EMAIL_BCC_ADDRESS=<bccaddress>
```

**Open the application.rb file, located in the /config directory, and rename the module from AppTemplate to the name of your application. Your module name should be without spaces and Camel Cased.  I.E. SearchForEnergy, Distill, CreateTheBridge**
```ruby
require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'susy'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppTemplate  # <-- Rename this
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
```

**Create a new repository and set the origin remote to the URL of the new repository.**
```
# Displays all the current remotes for a repository
> git remote -v  

# Set the URL of any given remote
> git remote set-url <remote name> <url>

# Example
> git remote set-url origin https://github.com/CreateTheBridge/Shift
```

**Update the README.md to be specific to the project.**

That's it. The application is ready for use and extension.  That took you what, five minutes?  You're welcome.

#### Environment Variables & Template File

```ruby
# Unicorn Configuration Variables
MAX_WORKER_PROCESSES # Applies hard limiting to the amount of worker threads allowed to be spawned by Unicorn.
MIN_WORKER_MEMORY # Designates the lower bound of when a worker thread is eligible for reaping.
MAX_WORKER_MEMORY # Designates the upper bound of when a worker thread is eligible for reaping.

# Redis
REDIS_URI # Designates the URI at which the Redis server is operating

# Database
DATABASE_NAME # The base name of the database.  This will have the environment appended to the end.
DATABASE_HOST # The address of the location PostgreSQL is hosted.
DATABASE_PORT # The port on which PostgreSQL is operating.
DATABASE_USER # The username the application will use to connect to the database.
DATABASE_PASSWORD # The password the application will use to connect to the database

# Email - By default Mandrill is used
MANDRILL_API_KEY # The API key generated from Mandrill.
MANDRILL_EMAIL_TEMPLATE # The name of the template in Mandrill used to send emails.
EMAIL_FROM_NAME # The name that appears as "from".
EMAIL_FROM_ADDRESS # The email address from which emails will be sent and replied to.
EMAIL_BCC_ADDRESS # A single, or array of email addresses which will be blind copied on all transactions.
```
