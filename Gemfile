source "http://rubygems.org"

ruby "~> 2.4.0"
gem 'rake'
gem 'excon'
gem 'activesupport', require: false
gem 'hamlit'
gem 'addressable'
gem 'rmagick'
gem 'sprite-factory', require: 'sprite_factory'
gem 'dotenv'

group :guard do
  gem 'guard'
  gem 'guard-yield'
  gem 'guard-livereload'
end

group :test do
  gem 'rspec'
  gem 'vcr'
end

group :production do
  gem 'rollbar'
end