require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )

get '/customers' do
  @customers = Customer.all()
  erb ( :"customers/index" )
end

get '/customers/dashboard' do
    @customers = Customer.all()
  erb( :"customers/dashboard")
end

get '/customers/new' do
    @customers = Customer.all()
  erb( :"customers/new_customer" )
end


post '/customers' do
  customer = Customer.new(params)
  customer.save()
  @ghost_types = GhostType.all()
  @location_types = LocationType.all()
  @customers = Customer.all()
  erb( :"hauntings/new_haunting")
end

get '/customers/:id' do
    @customer = Customer.find_by_id(params[:id])
  if @customer.hauntings.size > 0
    erb( :"customers/dashboard")
  else
    erb( :"customers/empty_dashboard")
  end
end
