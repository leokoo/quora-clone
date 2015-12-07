# To upvote
post "/questions/:id/upvote" do
	question = Question.find(params[:id])
	question.votes.create_with(vote_count: 1).find_or_create_by(user_id: session[:user_id]).update(vote_count: 1)
	# question_vote = Vote.create(user_id: session[:user_id], question_id: params[:id], vote_count: 1)
	erb :'questions/all'
	# question_vote.vote_count.to_json
end

# To downvote
post "/questions/:id/downvote" do
	question = Question.find(params[:id])
	question.votes.create_with(vote_count: -1).find_or_create_by(user_id: session[:user_id]).update(vote_count: -1)
	erb :'questions/all'
end

# To reset vote
post "/questions/:id/reset" do
	question = Question.find(params[:id])
	question.votes.where(user_id: current_user.id).destroy_all
	erb :'questions/all'
end