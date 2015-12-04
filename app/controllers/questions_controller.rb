# Display new question form
get '/questions/new' do
	erb :"questions/new"
end

# View All Questions
get '/questions/all' do
	erb :"questions/all"
end

# Create new question
post '/questions' do
	question = Question.new(title: params[:title], user_id: session[:user_id])
	if question.save
	redirect "/users/#{question.user_id}"
	else
		@warning = "Sorry, there's something wrong with your question"
		erb :"questions/new"
	end
	# redirect "/users/#{question.user_id}"
end

# View question
get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :'questions/show'
end

# Display question edit form
get '/questions/:id/edit' do
	@question = Question.find(params[:id])
	erb :'questions/edit'
end 

# Update question
patch '/questions/:id' do
	question = Question.find(params[:id])
	question.update(title: params[:title])
	redirect "/questions/#{question.id}"
end

# Delete question
delete '/questions/:id' do
	question = Question.find(params[:id])
	question.destroy
	erb :'static/index'
end
