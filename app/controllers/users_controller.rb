# Create
# Creating the new user
post '/signup' do 
	user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	if user.save
		redirect "users/#{user.id}"
	else
		@warning = "Sorry bro, there's something wrong with your details"
		erb :"users/login"
	end
end

# Read
# Reading the user login
post '/users/login' do
	user = User.authenticate(params[:email], params[:password])
	if user
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		@warning = "Login failed, please try again :)"
		erb :"users/login"
	end
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

helpers do 
	# This will return the current user, if they exit
	# Replace with code that works with your application
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id])
		end
	end
	# Return true if current_user exist, false others
	def logged_in?
		!current_user.nil?
	end
end