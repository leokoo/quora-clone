# post "/answers/:id/upvote" do
# 	answer = Answer.find(params[:id])
# 	answer.answer_votes.create(user_id: session[:user_id], vote_count: 1)
# 	erb :'questions/all'
# 	# question_vote.vote_count.to_json
# end

# User.create_with(last_name: 'Johansson').find_or_create_by(first_name: 'Scarlett')
# => #<User id: 2, first_name: "Scarlett", last_name: "Johansson">

post "/answers/:id/upvote" do
	answer = Answer.find(params[:id])
	answer.answer_votes.create_with(vote_count: 1).find_or_create_by(user_id: session[:user_id])
	erb :'questions/all'
end

post "/answers/:id/downvote" do
	answer = Answer.find(params[:id])
	answer.answer_votes.create_with(vote_count: -1).find_or_create_by(user_id: session[:user_id])
	erb :'questions/all'
end

# To update upvote
post "/answers/:id/reset" do
	answer = Answer.find(params[:id])
	answer.answer_votes.where(user_id: current_user.id).destroy_all
	erb :'questions/all'
end