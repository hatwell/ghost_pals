require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/hauntings_controller')
require_relative('controllers/neghostiations_controller')
require_relative('controllers/customers_controller')

get '/' do
  erb( :index )
end
