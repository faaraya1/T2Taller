Rails.application.routes.draw do
	#resources :users
	root "users#index"
	get '/usuario', to: 'users#index'
	put '/usuario', to: 'users#create'
	delete "/usuario/:id", to: 'users#destroy'
	get '/usuario/:id', to: 'users#show'
	post '/usuario/:id', to: 'users#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
