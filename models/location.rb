class Location
  attr_reader :id
  attr_accessor :location_name, :location_type_id

  def initialize(params)
    @location_name = params['location_name']
    @location_type_id = params['location_type_id'].to_i
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO locations(location_name, location_type_id) VALUES ('#{@location_name}', #{@location_type_id} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE locations SET (location_name, location_type_id) = ('#{@location_name}', #{@location_type_id} )"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM locations WHERE id = #{@id}"
  end

  def location_type
    sql = "SELECT name FROM location_types WHERE id = #{@location_type_id} "
    result = LocationType.map_items(sql)
    return result[0].name
  end

  def self.all()
    sql = "SELECT * FROM locations"
    Location.map_items(sql)
  end

  def self.map_items(sql)
    locations = SqlRunner.run(sql)
    result = locations.map {|location| Location.new(location)}
    puts result
    return result
  end

  def self.delete_all
    sql = "DELETE FROM locations"
    SqlRunner.run(sql)
  end

end
