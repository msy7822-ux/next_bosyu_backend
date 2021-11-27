source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'bcrypt', '~> 3.1.7'
gem 'twitter'
gem 'omniauth-twitter'
gem 'tweetkit'
gem 'dotenv-rails'
gem 'graphql'
# gem 'typhoeus'
# gem 'oauth'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-erd'
  gem 'rspec-rails'
  gem 'graphiql-rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop', require: false
  gem 'spring'
end

group :production do
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
