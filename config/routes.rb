Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'signup', to: 'users#new', as: 'signup'

  resources :users, except: [:destroy, :new]
  
  post 'follows/:id', to: 'follows#create', as: 'follows'
  delete 'follows/:id', to: 'follows#destroy'
  
  resources :posts do
  	resources :comments, except: [:new, :edit, :update]
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
  end

  
  root 'posts#index'
  get 'followings', to: 'posts#following_post', as: 'followings'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
