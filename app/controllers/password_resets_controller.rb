class PasswordResetsController <  ApplicationController
	def new
	end
	def create
		@user = User.find_by(email: params[:email])
		if @user.present?
			# send email
			PasswordMailer.with(user: @user).reset.deliver_later
		end
		redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password"
	end

	def edit
		# aqui la busqueda es por el signed, esta busqueda checa tmb que no sea caduco
		@user = User.find_signed!(params[:token], purpose: "password_reset")
		# el signo de admiracion es para que marque error al no encontrar o que el token este caduco
	rescue ActiveSupport::MessageVerifier::InvalidSignature
		redirect_to sign_in_path, alert: "Your token has expired. Please try again"
	end
	
	def update
		# aqui la busqueda es por el signed, esta busqueda checa tmb que no sea caduco
		@user = User.find_signed!(params[:token], purpose: "password_reset")
		if @user.update(password_params)
			redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in"
		else
			render :edit
		end

	end

	private
	def password_params
		params.require(:user).permit(:password, :password_confirmation)
	end
end