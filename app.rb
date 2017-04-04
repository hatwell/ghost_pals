require( 'sinatra' )
require( 'pry')
require( 'sinatra/contrib/all' )
require_relative('controllers/customers_controller')
require_relative('controllers/hauntings_controller')
require_relative('controllers/neghostiations_controller')
require_relative('models/ghost')




get '/' do
  erb( :index )
end

get '/ghosts/all' do
  @ghosts = Ghost.all
  # binding.pry
  erb(:all_ghosts)
end


not_found do
  erb(:error)
end
