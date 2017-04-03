require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/haunting.rb' )
require_relative( '../models/neghostiation.rb' )
require_relative('../models/investigator.rb')

get '/neghostiations/all' do
  @neghostiations = Neghostiation.all()
  erb ( :"investigators/index" )
end

get '/neghostiations/new' do
  @hauntings = Haunting.all
  erb( :"investigators/neghostiation_report" )
end

post '/neghostiations' do
  @haunting = Haunting.find(params['haunting_id'])
  @investigators = Investigator.all()
  erb ( :"investigators/new_report" )
end

get '/new_neghostiation' do
  @investigators = Investigator.all()
  erb ( :"investigators/new_report" )
end

post '/hauntings/save' do
  Haunting.new(params).save
  Ghost.new(params).save
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
