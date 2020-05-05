# require 'bundler'

# Bundler.require
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
ENV['SINATRA_ENV'] ||= "development"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)

require_all 'app'