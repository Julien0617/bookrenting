require 'sidekiq/web'

Rails.application.routes.draw do
    if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
  else
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'rentbook', to: 'users#rentbook'
  
  resources :users do 
    resources :books  
  end


  get 'signup', to: 'users#new'

  root 'sessions#new'
  resources :admins
  get 'identification', to: 'users#identification'

  resources :rentings
end
