class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	validates :question, 
		length: { minimum: 8 }

	belongs_to :user
end