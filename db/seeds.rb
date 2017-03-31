require('pg')
require('pry-byebug')
require_relative('../models/customer')
require_relative('../models/ghost_type')
require_relative('../models/haunting')
require_relative('../models/investigator')
require_relative('../models/location_type')
require_relative('../models/ghost')
require_relative('../models/location')
require_relative('../models/neghostiation')
require_relative('../models/person')
require_relative('../models/service')

LocationType.delete_all()
location_types = ['educational building', 'office building', 'home', 'shop', 'hospital', 'municipal building', 'outdoors', 'historical site', 'religious building']
location_types.sort!
location_types.each do |location_type|
    newLocationType = LocationType.new({
    'name' => location_type
    })
    newLocationType.save
    end


GhostType.delete_all()
ghost_types = ['spirit', 'ghoul', 'incubus', 'succubus', 'poltergheist', 'banshee', 'haint', 'demon', 'traditional ghost', 'wisp', 'egg ghost']
ghost_types.sort!
ghost_types.each do |ghost_type|
    newGhostType = GhostType.new({
    'name' => ghost_type
    })
    newGhostType.save
    end
binding.pry
nil
