source 'https://rubygems.org'

gem 'rails', '4.0.3'

# Assets
gem 'sass-rails', '~> 4.0.0'
gem 'jquery-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :production do
  gem 'mysql2'
  gem 'uglifier', '>= 1.3.0'
end

group :development, :test do
  gem 'sqlite3'

  gem 'pry'
  gem 'pry-nav'
  gem 'pry-stack_explorer', platforms: %w(mri rbx)

  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-rails', require: false
end

group :test do
  gem 'rspec',       '~> 3.0.0.rc1'
  gem 'rspec-rails', '~> 3.0.0.rc1'

  gem 'database_cleaner', require: false
  gem 'shoulda-matchers', require: false
  gem 'factory_girl_rails'
  gem 'ffaker'
end
