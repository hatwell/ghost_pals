class Neghostiation
  attr_reader :id
  attr_accessor :neghostiation_date, :investigator_id, :haunting_id, :services_id, :report, :successful

  def initialize(params)
    @neghostiation_date = params['neghostiation_date']
    @investigator_id = params['investigator_id'].to_i
    @haunting_id = params['haunting_id'].to_i
    @services_id = params['services_id'].to_i
    @report = params['report']
    @successful = params['successful']
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO neghostiations(neghostiation_date, investigator_id, haunting_id, services_id, report, successful) VALUES
    ('#{@neghostiation_date}', #{@investigator_id}, #{@haunting_id}, #{@services_id}, '#{@report}', #{@successful} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE hauntings SET (haunting_date, haunting_description, ghost_name, ghost_type_id) = ('#{@neghostiation_date}', #{@investigator_id}, #{@haunting_id}, #{@services_id}, '#{@report}', #{@successful} )"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM neghostiations WHERE id = #{@id}"
  end

  def location()
    sql = "SELECT locations.name FROM location INNER JOIN hauntings WHERE id = #{@haunting_id}"
    result = SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM neghostiations WHERE id = #{id}"
    Neghostiation.map_items(sql).first
  end

  def self.all()
    sql = "SELECT * FROM neghostiations"
    Neghostiation.map_items(sql)
  end

  def self.map_items(sql)
    neghostiations = SqlRunner.run(sql)
    result = neghostiations.map {|neghostiation| Neghostiation.new(neghostiation)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM neghostiations"
    SqlRunner.run(sql)
  end

end
