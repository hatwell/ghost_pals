require( 'pg' )

class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect({ dbname: 'db34eqo43348d5', host: 'postgres://dlvppddvkponnv:16b79ea377f1487372ecbb4474754aadb9ed010cb562732225e03aeb4f9700a5@ec2-54-247-92-185.eu-west-1.compute.amazonaws.com:5432/db34eqo43348d5' })
      result = db.exec( sql )
    ensure
      db.close
    end 
    return result
  end

end
