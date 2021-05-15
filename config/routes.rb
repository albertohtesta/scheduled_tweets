Rails.application.routes.draw do
	get "about-us", to: "about#index", as: :about
	# get "/", to: "main#index" o tambien: get "" o:
	root to: "main#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
