require( 'sinatra' )
require( 'pry' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
require_relative( '../models/ghost_type.rb' )
require_relative( '../models/ghost.rb' )
require_relative( '../models/haunting.rb' )
require_relative( '../models/location.rb' )
require_relative( '../models/location_type.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/service')

get '/hauntings' do
  @hauntings = Haunting.all
  erb(:all_hauntings)
end

get '/hauntings/new' do
  @ghost_types = GhostType.all()
  @location_types = LocationType.all()
  @customers = Customer.all()
  erb(:"hauntings/new_haunting")
end

post('/hauntings') do
  # @ghost_types = GhostType.all()
  # @location_types = LocationType.all()
  # @customers = Customer.all()
  haunting = Haunting.new(params)
  location = Location.new(params)
  ghost = Ghost.new(params)
  haunting.save
  location.save
  ghost.save
  erb(:"hauntings/submission")
end
