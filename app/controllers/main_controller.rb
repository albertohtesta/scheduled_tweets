class MainController < ApplicationController
	def index
		#flash.now[:notice] = "Logged succesfully" para solo ese request
		flash[:notice] = "Logged succesfully"
		flash[:alert] = "Invalid password"
	end
end