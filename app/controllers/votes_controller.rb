# To upvote
post "/questions/:id/upvote" do
	question = Question.find(params[:id])
	question.votes.create(user_id: session[:user_id], vote_count: 1)
	# question_vote = Vote.create(user_id: session[:user_id], question_id: params[:id], vote_count: 1)
	# erb :'questions/all'
	question_vote.vote_count.to_json
end

# To update upvote
post "/upvote/:id/:vote/reset" do
	votes = Vote.all
	votes.each do |vote|
		if vote.id == params[:vote].to_i
			vote.update(vote_count: 1)
		end
	end
	erb :'questions/all'
end

# To downvote
get "/questions/:id/downvote" do
	question_vote = Vote.create(user_id: session[:user_id], question_id: params[:id], vote_count: -1)
	erb :'questions/all'
end

# To reset vote
post "/questions/:id/:vote/reset" do
	votes = Vote.all
	votes.each do |vote|
		if vote.id == params[:vote].to_i
			vote.destroy
		end
	end
	erb :'questions/all'
end

# To update downvote
post "/downvote/:id/:vote/reset" do
	votes = Vote.all
	votes.each do |vote|
		if vote.id == params[:vote].to_i
			vote.update(vote_count: -1)
		end
	end
	erb :'questions/all'
end