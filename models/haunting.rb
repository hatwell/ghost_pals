require_relative('../db/sql_runner')
require_relative('../models/ghost_type')
class Haunting
  attr_reader :id
  attr_accessor :haunting_name, :haunting_id, :haunting_description, :haunting_date, :ghost_name, :ghost_type_id, :location_name, :location_type_id, :customer_id

  def initialize (params)
    @haunting_name = params['haunting_name']
    @haunting_date = params['haunting_date']
    @haunting_description = params['haunting_description']
    @ghost_name = params['ghost_name']
    @ghost_type_id = params['ghost_type_id'].to_i
    @location_name = params['location_name']
    @location_type_id = params['location_type_id'].to_i
    @customer_id = params['customer_id'].to_i
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO hauntings(
    haunting_name, haunting_date, haunting_description, ghost_name, ghost_type_id, location_name, location_type_id, customer_id) VALUES ('#{@haunting_name}', '#{@haunting_date}', '#{@haunting_description}', '#{@ghost_name}', #{@ghost_type_id}, '#{@location_name}', #{@location_type_id},  #{@customer_id} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE hauntings SET (haunting_name, haunting_date, haunting_description, ghost_name, ghost_type_id, location_name, location_type_id, customer_id) = ('#{@haunting_name}', '#{@haunting_description}', '#{@ghost_description}', #{@ghost_type_id}, '#{@location_name}', #{@location_type_id}, #{@customer_id})"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM hauntings WHERE id = #{@id}"
  end

  def location_type()
    sql = "SELECT * FROM location_types WHERE id = #{@location_type_id}"
    location_type = LocationType.map_items(sql).first()
    return location_type.name
  end

  def ghost_type
    sql = "SELECT * FROM ghost_types WHERE id = #{@ghost_type_id}"
    ghost_type = GhostType.map_items(sql).first()
    return ghost_type.name
  end

  def neghostiation ()
    sql = "SELECT neghostiations.* FROM neghostiations WHERE haunting_id = #{@id}"
    Neghostiation.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM HAUNTINGS WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM hauntings"
    Haunting.map_items(sql)
  end

  def self.map_items(sql)
    hauntings = SqlRunner.run(sql)
    result = hauntings.map {|haunting| Haunting.new(haunting)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM hauntings"
    SqlRunner.run(sql)
  end


end
