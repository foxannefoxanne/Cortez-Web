Rails.application.routes.draw do
<<<<<<< HEAD
  resources :maps do
  	resources :pins
  end 
  
  #root 'maps#index'
  root 'maps#home'
  get 'new_maps' => 'maps#new'

=======

  get 'sessions/new'

  root             'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :maps do
    resources :pins
  end 
  
  get   'dump'  => 'maps#dump'
  
  #root 'maps#index'
  get 'new_maps' => 'maps#new'
>>>>>>> hail_marry
end
