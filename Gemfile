source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.3"  # Full-stack web application framework.
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"  # Pg is the Ruby interface to the PostgreSQL RDBMS
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"  # A Ruby/Rack web server built for parallelism.
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"  # A database backed ActiveSupport::Cache::Store
gem "solid_queue"  # Database-backed Active Job backend.
gem "solid_cable"  # Database-backed Action Cable backend.

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false  # Boot large ruby/rails apps faster

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false  # Deploy web apps in containers to servers running Docker with zero downtime.

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false  # Zero-config HTTP/2 proxy

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

gem "devise"  # Flexible authentication solution for Rails with Warden
gem "devise-jwt"  # JWT authentication for devise
gem "rack-cors"  # Middleware for enabling Cross-Origin Resource Sharing in Rack apps

gem 'config'  # Effortless multi-environment settings in Rails, Sinatra, Padrino and others


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"  # Debugging functionality for Ruby

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false  # Security vulnerability scanner for Ruby on Rails.

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false  # Omakase Ruby styling for Rails
  gem 'rubocop', require: false  # Automatic Ruby code style checking tool.
  gem 'rubocop-rails', require: false  # Automatic Rails code style checking tool.
  gem 'rubocop-rspec', require: false  # Code style checking for RSpec files
  gem 'rswag-api'  # A Rails Engine that exposes OpenAPI (formerly called Swagger) files as JSON endpoints
  gem 'rswag-ui'  # A Rails Engine that includes swagger-ui and powers it from configured OpenAPI (formerly named Swagger) endpoints
  gem 'rswag-specs'  # An OpenAPI-based (formerly called Swagger) DSL for rspec-rails & accompanying rake task for generating OpenAPI specification files
  gem 'rspec-rails'  # RSpec for Rails
end

group :test do
  gem "simplecov", require: false
end
