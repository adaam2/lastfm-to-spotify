source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'redis'
gem 'webpacker'
gem 'react-rails'
gem 'sidekiq'
gem 'httparty'
gem 'rollbar'
gem 'activeadmin', github: 'activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'devise'
gem 'kaminari'

# Configuration
gem 'dotenv-rails'
gem 'dry-auto_inject', '~> 0.3'
gem 'dry-container', '~> 0.3'
gem 'dry-logic', '~> 0.2.3'

# Auth
gem 'omniauth'
gem 'omniauth-lastfm'

# Third party
gem 'lastfm'
gem 'rspotify'

group :test do
  gem 'rspec'
  gem 'rspec-rails', '~> 3.5'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails', '~> 4.7.0', require: false
  gem 'timecop'
  gem 'webmock'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'bullet', group: 'development'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
