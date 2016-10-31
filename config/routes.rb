Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#show'

  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :links, only: [:index, :create]


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

end
