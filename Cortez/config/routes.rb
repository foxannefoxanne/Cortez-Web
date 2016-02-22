Rails.application.routes.draw do

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

  get   'dump'  => 'maps#dump'

  resources :maps do
    resources :pins
  end 
  
  #root 'maps#home'
  get 'new_maps' => 'maps#new'


end
