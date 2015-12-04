class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :title,
		presence: true
	belongs_to :user
	belongs_to :question
end