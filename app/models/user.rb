class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :email, 
		uniqueness: true,
		format: { :with => /\w+(.)*\w+@\w+(.)*\w+/}
	validates :name, uniqueness: true
	
end
