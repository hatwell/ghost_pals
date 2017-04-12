
require_relative('../db/sql_runner')

class Service

  attr_reader :id
  attr_accessor :name

  def initialize(params)
    @name = params['name']
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO services(name) VALUES ('#{@name}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE services SET (name) = '#{@name}'"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM services WHERE id = #{id}"
    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM services"
    Service.map_items(sql)
  end

  def self.map_items(sql)
    services = SqlRunner.run(sql)
    result = services.map {|service| Service.new(service)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM services"
    SqlRunner.run(sql)
  end

end
