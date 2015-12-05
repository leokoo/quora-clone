# Create new answer
post '/answers' do
	answer = Answer.create(reply: params[:reply], user_id: session[:user_id], question_id: params[:question_id])
		redirect "/questions/#{answer.question.id}"
		# erb :"answers/new"
end

# View All Answers
get '/answers/all' do
	erb :"answers/all"
end

# View answer
get '/answers/:id' do
	@answer = Answer.find(params[:id])
	erb :'answers/show'
end

# Display answer edit form
get '/answers/:id/edit' do
	@answer = Answer.find(params[:id])
	erb :'answers/edit'
end 

# # Update question
# patch '/questions/:id' do
# 	question = Question.find(params[:id])
# 	question.update(title: params[:title], user_id: session[:user_id])
# 	redirect "/questions/#{question.id}"
# end

# # Delete question
# delete '/questions/:id' do
# 	question = Question.find(params[:id])
# 	question.destroy
# 	erb :'static/index'
# end
