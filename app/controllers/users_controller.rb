# Create
# Creating the new user
post '/signup' do 
	user = User.new(name: params[:name], email: params[:email], password: params[:password])
	if user.save
		redirect "users/#{user.id}"
	else
		@warning = "Sign up failed, invalid details, please retry"
		redirect "users/login/?warning_msg=#{@warning}"
	end
end

# Read
# Reading the user login
post '/users/login' do
	user = User.find_by(email: params[:email], password: params[:password])
	session[:user_id] = user.id
	redirect "/users/#{user.id}"
end

# User logout
get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

# Read the route for user signup
get '/users/login' do
	erb :"users/login"
end

# Read the route for user login v2
get '/users/login/' do
	@warning = params[:warning_msg] if params[:warning_msg]
	erb :"users/login"
end

# Read User Profile
get '/users/:id' do
	@user = User.find(params[:id])
	erb :'users/profile'
end

# Update
# Display user edit form
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'users/edit'
end 

# Delete