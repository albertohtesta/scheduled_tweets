Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, Rails.application.credentials.dig(:twitter, :api_key), Rails.application.credentials.dig(:twitter, :api_secret)
end

# habilita omniauth en nuestra app y trae la gema de twitter en automatico
# esto tmb logea la app con twitter y trae los datos de twitter que se usan en el callback: 
# omniauth_callbacks_controller

