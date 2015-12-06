# To upvote
get "/questions/:id/upvote" do
	question_vote = Vote.create(user_id: session[:user_id], question_id: params[:id], vote_count: 1)
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

# To reset vote and upvote
post "/upvote/:id/:vote/reset" do
	votes = Vote.all
	votes.each do |vote|
		if vote.id == params[:vote].to_i
			vote.update(vote_count: 1)
		end
	end
	erb :'questions/all'
end

# To reset vote and downvote
post "/downvote/:id/:vote/reset" do
	votes = Vote.all
	votes.each do |vote|
		if vote.id == params[:vote].to_i
			vote.update(vote_count: -1)
		end
	end
	erb :'questions/all'
end