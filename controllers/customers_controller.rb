require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )

get '/customers' do
  @customers = Customer.all()
  erb ( :"customers/index" )
end
