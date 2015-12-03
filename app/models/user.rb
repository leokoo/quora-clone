require 'bcrypt'

class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	# users.password_hash in the database is a :string include BCrypt
	validates :email, 
		uniqueness: true,
		format: { :with => /\w+(.)*\w+@\w+(.)*\w+/}
	validates :name, uniqueness: true
	
end
