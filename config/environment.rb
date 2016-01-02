require 'bundler/setup'
Bundler.require

$: << '.'

require_all 'app'

configure :development do
  set :database, "sqlite3:db/database.db"
end
