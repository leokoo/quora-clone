# Display new question form
get '/questions/new' do
	erb :"questions/new"
end

# Create new question
post '/questions' do
	question = Question.create(title: params[:title], user_id: session[:user_id])
	redirect "/questions/#{question.id}"
end

# Display question edit form
get '/questions/:id/edit' do
	@question = Question.find(params[:id])
	erb :'questions/edit'
end 

# Update question
patch '/questions/:id' do
	question = Question.find(params[:id])
	question.update(title: params[:title], user_id: session[:user_id])
	redirect "/questions/#{question.id}"
end

# Delete question
delete '/questions/:id' do
	question = Question.find(params[:id])
	question.destroy
	erb :'static/index'
end

# View question
get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :'question/show'
end