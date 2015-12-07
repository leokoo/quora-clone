class AnswerVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	# validates_uniqueness_of :vote_count, scope: [:answer_id]
	belongs_to :answer
	belongs_to :user
end