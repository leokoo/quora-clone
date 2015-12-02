class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :email, uniqueness: true
	
end
