class SessionController < ApplicationController
	# skip_before_filter :handle_session

	# force_ssl

	# layout "user"

	def new
		
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:encrypted_password])
			session[:user_id] = user.id
			redirect_to user_path, :notice => "You are logged in!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, :notice => "You are logged out!"
	end
end
