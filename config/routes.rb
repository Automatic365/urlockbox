Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#show'

  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create]

end
