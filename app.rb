require( 'sinatra' )
require( 'pry')
require( 'sinatra/contrib/all' )
require_relative('controllers/customers_controller')
require_relative('controllers/hauntings_controller')
require_relative('controllers/neghostiations_controller')
require_relative('models/ghost')
require_relative('models/service')

get '/' do
  @services = Service.all
  @ghosts = Ghost.all
  @ghost_types = Ghost.ghost_types
  @length = @ghost_types.length
  erb( :index )
end

get '/ghosts/all' do
  @services = Service.all
  @ghosts = Ghost.all
  # binding.pry
  erb(:all_ghosts)
end


not_found do
  @services = Service.all
  erb(:error)
end
