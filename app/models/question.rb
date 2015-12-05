class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :title,
		presence: true
	belongs_to :user
	has_many :answers
	has_many :question_votes
end