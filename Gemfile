# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.8", ">= 7.0.8.1"

gem "bootsnap", require: false
gem "devise", "~> 4.9"
gem "importmap-rails"
gem "jbuilder"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "simple_form"
gem "sprockets-rails"
gem "sqlite3"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "view_component", "~> 3.10.0"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "factory_bot", "~> 6.4"
  gem "faker", "~> 3.3"
  gem "rspec", "~> 3.13"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 6.2"
end

gem "rspec-rails", "~> 6.1"
