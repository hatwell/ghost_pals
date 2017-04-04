require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customers_controller')
require_relative('controllers/hauntings_controller')
require_relative('controllers/neghostiations_controller')

get '/' do
  erb( :index )
end

get '/ghosts/all' do
  @ghosts = ghost.all
  erb(:all_ghosts)
end


not_found do
  erb(:error)
end
