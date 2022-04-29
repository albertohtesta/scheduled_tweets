Rails.application.routes.draw do

	# get "/", to: "main#index" o tambien: get "" o:
	root to: "main#index"
	get "about-us", to: "about#index", as: :about
	
	# cuando se olvida el password - pantalla donde se da el email y controler que mande email
	get "password/reset", to: "password_resets#new"
	post "password/reset", to: "password_resets#create"
	
	# pantalla cuando se hace el cambio de password
	get "password/reset/edit", to: "password_resets#edit"
	patch "password/reset/edit", to: "password_resets#update"

	# cuando se quiere modificar el password
	get "password", to: "passwords#edit", as: :edit_password
	patch "password", to: "passwords#update"


	get "sign_up", to: "registrations#new"
	post "sign_up", to: "registrations#create"

	get "sign_in", to: "sessions#new"
	post "sign_in", to: "sessions#create"
	delete "logout", to: "sessions#destroy"

	# esta es la callback url que indicamos en twitter:
	get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"
	# post "/auth/twitter/ esta ruta la crea omniauth en automatico y es al que usamos en el main/index 
	# para redireccionar a twitter
	
	# aqui se crean as rutas genericas de twitter_accounts
	resources :twitter_accounts
	resources :tweets


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
