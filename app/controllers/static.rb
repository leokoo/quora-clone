get '/' do
	@warning = params[:warning_msg] if params[:warning_msg]
  erb :"static/index"
end