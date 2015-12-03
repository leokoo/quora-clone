helpers do 
	# This will return the current user, if they exit
	# Replace with code that works with your application
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by_id(session)
		end
	end

	byebug

	# Return true if current_user exist, false others
	def logged_in?
		!current_user.nil?
	end

	def users?
		session[:user_id]
	end
end