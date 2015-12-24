require 'bundler/setup'
Bundler.require

$: << '.'

Dir['app.controllers/*.rb'].each {|f| require f}
Dir['app.models/*.rb'].each {|f| require f}
