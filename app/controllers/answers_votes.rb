post "/answers/:id/upvote" do
	answer = Answer.find(params[:id])
	answer.answer_votes.create(user_id: session[:user_id], vote_count: 1)
	erb :'questions/all'
	# question_vote.vote_count.to_json
end