# Create new answer
post '/answers' do
	answer = Answer.new(reply: params[:reply], user_id: session[:user_id], question: params[:question])
	if answer.save
	redirect "/users/#{answer.user_id}"
	else
		@warning = "Sorry, there's something wrong with your question"
		erb :"answers/new"
	end
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
