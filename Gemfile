source 'https://rubygems.org'

gem 'rails', '5.0.0.rc1'
gem 'turbolinks', '5.0.0.beta2'
gem 'puma'
gem 'uglifier', '>= 1.3.0'

gem 'execjs'
gem 'therubyracer'

gem 'sass-rails'
gem 'jquery-rails'

gem 'sqlite3'

gem 'redcarpet'
gem 'kaminari', :git => "git://github.com/amatsuda/kaminari.git", :branch => 'master'
gem 'aws-sdk', '~> 2.0'
# Gem in rubygems not yet compatible with Rails 5
gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on'
gem 'bootstrap', '>=4.0.0.alpha3'
gem 'exception_notification'
gem 'browser'

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-puma'

  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
end

group :test, :development do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'

  gem 'rspec-rails'
  gem 'capybara'
  gem 'rack-mini-profiler'
  gem 'flamegraph'
  gem 'stackprof' # ruby 2.1+ only
  gem 'memory_profiler'
end
