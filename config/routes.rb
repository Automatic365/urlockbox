Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#show'


  resources :users, only: [:new, :create, :show]
  resources :links, only: [:index, :create, :edit, :update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
