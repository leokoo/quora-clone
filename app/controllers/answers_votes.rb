# post "/answers/:id/upvote" do
# 	answer = Answer.find(params[:id])
# 	answer.answer_votes.create(user_id: session[:user_id], vote_count: 1)
# 	erb :'questions/all'
# 	# question_vote.vote_count.to_json
# end

post "/answers/:id/upvote" do
	answer = Answer.find(params[:id])
	answer.answer_votes.create(user_id: session[:user_id], vote_count: 1)
	erb :'questions/all'
end

# To update upvote
post "/answers/:id/reset" do
	answer = Answer.find(params[:id])
	answer = answer.answer_votes.where(user_id: current_user.id).destroy_all
	erb :'questions/all'
end