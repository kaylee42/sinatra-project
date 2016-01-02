require 'bundler/setup'
Bundler.require

$: << '.'

Dir['app.controllers/*.rb'].each {|f| require f}
Dir['app.models/*.rb'].each {|f| require f}

configure :development do
  set :database, "sqlite3:db/database.db"
end
