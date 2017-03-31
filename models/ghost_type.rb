
require_relative('../db/sql_runner')

class GhostType

  attr_reader :id
  attr_accessor :name

  def initialize(params)
    @name = params['name']
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO ghost_types(name) VALUES ('#{@name}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE ghost_types SET (name) = '#{@name}'"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM ghost_types WHERE id = #{id}"
  end


  def self.all()
    sql = "SELECT * FROM ghost_types"
    GhostType.map_items(sql)
  end

  def self.map_items(sql)
    ghost_types = SqlRunner.run(sql)
    result = ghost_types.map {|ghost_type| GhostType.new(ghost_type)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM ghost_types"
    SqlRunner.run(sql)
  end






end
