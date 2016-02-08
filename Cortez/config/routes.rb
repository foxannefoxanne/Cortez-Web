Rails.application.routes.draw do
  resources :maps do
  	resources :pins
  end 
  
  #root 'maps#index'
  root 'maps#home'
  get 'new_maps' => 'maps#new'

end
