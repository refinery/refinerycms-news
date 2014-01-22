source "http://rubygems.org"

gemspec

git 'https://github.com/refinery/refinerycms.git', branch: 'master' do
  gem 'refinerycms-authentication'
  gem 'refinerycms-dashboard'
  gem 'refinerycms-pages'
  gem 'refinerycms-images'
  gem 'refinerycms-testing', group: :test
end
gem 'refinerycms-settings', github: 'refinery/refinerycms-settings', branch: 'master'
gem 'refinerycms-i18n', github: 'refinery/refinerycms-i18n', branch: 'master'

gem 'globalize', github: 'globalize/globalize', branch: 'master'
gem 'seo_meta', github: 'parndt/seo_meta', branch: 'master'

# Database Configuration
unless ENV['TRAVIS']
  gem 'activerecord-jdbcsqlite3-adapter', :platform => :jruby
  gem 'sqlite3', :platform => :ruby
end

if !ENV['TRAVIS'] || ENV['DB'] == 'mysql'
  gem 'activerecord-jdbcmysql-adapter', :platform => :jruby
  gem 'jdbc-mysql', '= 5.1.13', :platform => :jruby
  gem 'mysql2', :platform => :ruby
end

if !ENV['TRAVIS'] || ENV['DB'] == 'postgresql'
  gem 'activerecord-jdbcpostgresql-adapter', :platform => :jruby
  gem 'pg', :platform => :ruby
end

# Refinery/rails should pull in the proper versions of these
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

# Load local gems according to Refinery developer preference.
if File.exist? local_gemfile = File.expand_path('../.gemfile', __FILE__)
  eval File.read(local_gemfile)
end
