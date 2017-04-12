require( 'pg' )

class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect("dbname=db34eqo43348d5 host=ec2-54-247-92-185.eu-west-1.compute.amazonaws.com port=5432 user=dlvppddvkponnv password=16b79ea377f1487372ecbb4474754aadb9ed010cb562732225e03aeb4f9700a5 sslmode=require")
      result = db.exec( sql )
    rescue PG::Error => e
      puts "***********"
      puts e
      puts "***********"
    ensure
      db.close
    end
    return result
  end

end
