#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path

	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://dlvppddvkponnv:16b79ea377f1487372ecbb4474754aadb9ed010cb562732225e03aeb4f9700a5@ec2-54-247-92-185.eu-west-1.compute.amazonaws.com:5432/db34eqo43348d5')

	# ActiveRecord::Base.establish_connection(
	# 		:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
	# 		:host     => db.host,
	# 		:username => db.user,
	# 		:password => db.password,
	# 		:database => db.path[1..-1],
	# 		:encoding => 'utf8'
	# )
