require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require_relative('controllers/hauntings_controller')
# require_relative('controllers/neghostiations_controller')
# require_relative('controllers/customers_controller')

get '/hauntings' do
  @hauntings = Haunting.all
  erb(:all_hauntings)
end

get '/hauntings/new' do
  erb(:haunting_report)
end
