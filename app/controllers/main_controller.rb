class MainController < ApplicationController
	def index

	#if session[:user_id]   esto se paso a application_controller
		#@user = User.find(session[:user_id]) marca error si el user no existe en la BD
		@user = User.find_by(id: session[:user_id])
	#end

		#flash.now[:notice] = "Logged succesfully" para solo ese request
		#flash[:notice] = "Logged succesfully"
		#flash[:alert] = "Invalid password"
	end
end