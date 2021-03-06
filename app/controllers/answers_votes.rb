# post "/answers/:id/upvote" do
# 	answer = Answer.find(params[:id])
# 	answer.answer_votes.create(user_id: session[:user_id], vote_count: 1)
# 	erb :'questions/all'
# 	# question_vote.vote_count.to_json
# end

# To upvote via creating a new vote, or resetting the current vote to 1
post "/answers/:id/upvote" do
	answer = Answer.find(params[:id])
	answer.answer_votes.create_with(vote_count: 1).find_or_create_by(user_id: session[:user_id]).update(vote_count: 1)
	erb :'questions/all'
end

# To upvote via creating a new vote, or resetting the current vote to -1
post "/answers/:id/downvote" do
	answer = Answer.find(params[:id])
	answer.answer_votes.create_with(vote_count: -1).find_or_create_by(user_id: session[:user_id]).update(vote_count: -1)
	erb :'questions/all'
end

# To reset votes
post "/answers/:id/reset" do
	answer = Answer.find(params[:id])
	answer.answer_votes.where(user_id: current_user.id).destroy_all
	erb :'questions/all'
end