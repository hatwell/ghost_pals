require_relative('../models/location')

class Ghost
  attr_reader :id
  attr_accessor :ghost_name, :ghost_type_id

  def initialize(params)
    @ghost_name = params['ghost_name']
    @ghost_type_id = params['ghost_type_id'].to_i
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO ghosts(ghost_name, ghost_type_id) VALUES ('#{@ghost_name}', #{@ghost_type_id} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE ghosts SET (ghost_name, ghost_type_id) = ('#{@ghost_name}', #{@ghost_type_id} )"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM ghosts WHERE id = #{@id}"
  end

  def ghost_type
    sql = "SELECT name FROM ghost_types WHERE id = #{@ghost_type_id} "
    result = GhostType.map_items(sql)
    return result[0].name
  end

  def location_sighted
    sql = "SELECT * FROM hauntings WHERE ghost_name = '#{@ghost_name}'"
    result = Location.map_items(sql)
    return "" if result.first == nil
    return result.first.location_name
  end

  def ghost_type()
    sql = "SELECT * FROM ghost_types WHERE id = #{@ghost_type_id}"
    result = SqlRunner.run(sql)
    return result.first['name']
  end

  #Class Methods

  def self.ghost_types
    @ghosts = Ghost.all()
    type_counter = Hash.new()
    @ghosts.each do |ghost|
      type = ghost.ghost_type
      type_counter.has_key?(type) ? type_counter[type] += 1 : type_counter[type] = 1
    end
    return type_counter
  end

  # @ghost_type_count = Ghost.ghost_types
  #
  # for ghost in @ghost_type_count.keys

  def self.ghost_type_count(ghost_type)
    type_counter = self.ghost_types()
    return type_counter[ghost_type]
  end

  def self.all()
    sql = "SELECT * FROM ghosts"
    Ghost.map_items(sql)
  end

  def self.map_items(sql)
    ghosts = SqlRunner.run(sql)
    result = ghosts.map {|ghost| Ghost.new(ghost)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM ghosts"
    SqlRunner.run(sql)
  end

end
