Rails.application.routes.draw do
  resources :maps do
  	resources :pins
  end 
  resources :pins 
  
  #root 'maps#index'
  root 'maps#home'
  get 'new_maps' => 'maps#new'

end
