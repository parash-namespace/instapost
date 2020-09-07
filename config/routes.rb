Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  

  get 'signup', to: 'users#new', as: 'signup'
  resources :users, except: [:destroy, :new]
  
  resources :posts do
  	resources :comments, except: [:new, :edit, :update]
  end
  
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
