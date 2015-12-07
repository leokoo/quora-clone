class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :reply,
		presence: true
	has_many :answer_votes
	belongs_to :user
	belongs_to :question
end