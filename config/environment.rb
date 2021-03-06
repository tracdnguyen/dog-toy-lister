require 'bundler/setup'
Bundler.require
require 'rack-flash'
require 'sinatra/base'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
