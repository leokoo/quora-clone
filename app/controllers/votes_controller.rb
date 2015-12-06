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
post "questions/:id/:vote/reset/" do
end