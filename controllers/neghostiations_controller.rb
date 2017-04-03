require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/haunting.rb' )
require_relative( '../models/neghostiation.rb' )

get '/neghostiations' do
  @neghostiations = Neghostiation.all()
  erb ( :"investigators/index" )
end

get '/neghostiations/new' do
  erb( :"investigators/neghostiation_report" )
end

#ToDo
# post '/neghostiations/new' do
#   neghostiation = Customer.new()
#   neghostiation.save()
#   erb( :"neghostiations/new_haunting")
# end
#
get '/neghostiations/:id' do
  @neghostiation = Neghostiation.find_by_id(params[:id])
  erb( :"investigators/neghostiation_details")
end
