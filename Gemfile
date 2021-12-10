source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails'
gem 'graphql'
gem 'jwt'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'redis-rails'
gem 'sendgrid-ruby'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'sidekiq'
gem 'twitter'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'graphiql-rails'
  gem 'rails-erd'
  gem 'rspec-rails'
  gem 'seed-fu'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop', require: false
  # gem 'spring'
  gem 'bullet'
end

group :production do
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
