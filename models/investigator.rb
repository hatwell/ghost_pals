
require_relative('../db/sql_runner')

class Investigator

  attr_reader :id
  attr_accessor :name, :email_address

  def initialize(params)
    @name = params['name']
    @email_address = params['email_address']
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO investigators(name, email_address) VALUES ('#{@name}', '#{@email_address}' ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE investigators SET (name, email_address) = '#{@name}','#{@email_address}'"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM investigators WHERE id = #{id}"
  end


  def self.all()
    sql = "SELECT * FROM investigators"
    Investigator.map_items(sql)
  end

  def self.map_items(sql)
    investigators = SqlRunner.run(sql)
    result = investigators.map {|investigator| Investigator.new(investigator)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM investigators"
    SqlRunner.run(sql)
  end

end
