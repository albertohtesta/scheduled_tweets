class OmniauthCallbacksController < ApplicationController
	def twitter
		Rails.logger.info auth # para hacer un console al objeto 
		twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
		twitter_account.update(
			name: auth.info.name,
			username: auth.info.nickname,
			imagen: auth.info.image,
			token: auth.credentials.token,
			secret: auth.credentials.secret
			)
		redirect_to twitter_accounts_path, notice: "Successfully connected your account"
	end
	def auth
		request.env['omniauth.auth'] 
		# this give us the credentials from twitter
	end
end