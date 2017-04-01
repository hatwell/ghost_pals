require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require_relative('controllers/hauntings_controller')
# require_relative('controllers/neghostiations_controller')
# require_relative('controllers/customers_controller')

get '/customers' do
  @customers = Customer.all
  erb(:existing_customers)
end

get '/customers/new' do
  erb(:new_customer)
end

post '/customers' do
  customer = Customer.new(params)
  customer.save
  redirect to("/hauntings/new")
end
