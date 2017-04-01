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
  erb( :"hautings/new_haunting")
end
