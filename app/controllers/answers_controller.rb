# Create new answer
post '/answers' do
	answer = Answer.create(reply: params[:reply], user_id: session[:user_id], question_id: params[:question_id])
		redirect "/questions/#{answer.question.id}"
		# erb :"answers/new"
end

# Display new question form
get '/answers/new' do
	erb :"answers/new"
end

# # View All Questions
# get '/questions/all' do
# 	erb :"questions/all"
# end

# # Display question edit form
# get '/questions/:id/edit' do
# 	@question = Question.find(params[:id])
# 	erb :'questions/edit'
# end 

# # View question
# get '/questions/:id' do
# 	@question = Question.find(params[:id])
# 	erb :'questions/show'
# end

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
