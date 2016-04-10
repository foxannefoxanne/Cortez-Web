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

  get 'maps_dump' => 'maps#maps_dump'

  resources :maps do
    get :map_dump
    resources :pins do
      get :pin_dump
      get :editmedia
      post :editmedia
      resources :pictures
      resources :audios
      resources :videos
    end
  end 
  
  #root 'maps#home'
  get 'new_maps' => 'maps#new'


end
