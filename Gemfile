source "https://rubygems.org"

ruby "3.2.0"

gem "rails", "~> 7.1.0"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

gem 'payjp'

group :development, :test do
  gem "mysql2", "~> 0.5" # ← ローカルで使うMySQL
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'dotenv-rails'
  gem 'pry-rails'
end


group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end



gem 'devise'

gem 'active_hash'

# Gemfile のどこかに次を記述（groupの外に書く）
gem 'gon'

group :production do
  gem 'pg'
end