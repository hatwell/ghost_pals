class Haunting
  attr_reader :id
  attr_accessor :haunting_date, :haunting_id, :haunting_description

  def initialize (params)
    @haunting_date = params['haunting_date']
    @haunting_description = params['haunting_description']
    @ghost_name = params['haunting_name']
    @ghost_type_id = params['haunting_type_id']
  end

  def save()
    sql = "INSERT INTO hauntings(haunting_date, haunting_description, ghost_name, ghost_type_id) VALUES ('#{@haunting_date}', '#{@haunting_description}', '#{@ghost_name}', #{@ghost_type_id} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE hauntings SET (haunting_date, haunting_description, ghost_name, ghost_type_id) = ('#{@haunting_date}', '#{@haunting_description}', '#{@ghost_name}', #{@ghost_type_id})"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM hauntings WHERE id = #{@id}"
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
