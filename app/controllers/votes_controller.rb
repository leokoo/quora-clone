# Add an upvote
post '/vote/upvote' do
	question_vote = Vote.create(user_id: session[:user_id], question_id: params[:question_id], vote_count: 1)
	erb :'questions/all'
end
# Add a downvote
post '/vote/downvote' do
	question_vote = Vote.create(user_id: session[:user_id], question_id: params[:question_id], vote_count: -1)
	erb :'questions/all'
end

# Total Votes