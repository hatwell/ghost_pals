
require_relative('../db/sql_runner')

class LocationType

  attr_reader :id
  attr_accessor :name

  def initialize(params)
    @name = params['name']
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO location_types(name) VALUES ('#{@name}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE location_types SET (name) = '#{@name}'"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM location_types WHERE id = #{id}"
  end


  def self.all()
    sql = "SELECT * FROM location_types"
    LocationType.map_items(sql)
  end

  def self.map_items(sql)
    location_types = SqlRunner.run(sql)
    result = location_types.map {|location_type| LocationType.new(location_type)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM location_types"
    SqlRunner.run(sql)
  end






end
