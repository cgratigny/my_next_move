source "https://rubygems.org"

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# way to build random stuff
gem 'forgery', require: false

# Use for forms
gem "simple_form"
gem 'simple_form-tailwind'

# validate urls
gem "validate_url"

# Postgres database gem
gem "pg"
gem "pg_search"

# HasScope allows you to dynamically apply named scopes to your resources based on an incoming set of parameters.
gem "has_scope"

gem 'acts-as-taggable-on'

# Track database changes
gem 'paper_trail'

# annotate the model files
gem 'annotate'

# for breadcrumbs
gem 'loaf'

# Provides hamlit generators for Rails. It also enables hamlit as the templating engine and "hamlit:erb2haml" rake task that converts erb files to haml.
gem 'hamlit-rails'

# allows us to use rake hamlit:erb2haml to convert any stray erb files to haml
gem 'html2haml' 

gem 'view_component'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# ClassyEnum is a Ruby on Rails gem that adds class-based enumerator functionality to Active Record attributes.
gem "classy_enum"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem "binding_of_caller"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler"

  gem 'rails-erd'

  gem "rails_best_practices"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring"

  gem 'better_errors'

  gem 'listen'

  # finds syntax errors
  gem "brakeman", "~> 5.4"
end

group :test do
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'shoulda'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'rspec-activemodel-mocks'

  gem 'simplecov', require: false

  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

gem "tailwindcss-rails", "~> 2.1"

gem "rails_heroicon"

gem "mechanize", "~> 2.9"

gem "devise", "~> 4.9"
