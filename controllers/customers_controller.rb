require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )

get '/customers' do
  @customers = Customer.all()

  erb ( :"customers/index" )
end

get '/customers/new' do
  erb( :"customers/new_customer" )
end


post '/customers/new' do
  customer = Customer.new()
  customer.save()
  erb( :"hauntings/new_haunting")
end

get '/customers/:id' do
  @customer = Customer.find_by_id(params[:id])
  erb( :"customers/dashboard")
end
