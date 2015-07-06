Rails.application.routes.draw do

  root 'sessions#new'
  
  #For channels
  get 'create_channel' => 'channels#new'
  get 'join_channel' => 'channels#dummy'
  #post 'join_channel' => 'csessions#create'
  #delete 'exit_channel' => 'csessions#destroy'
  get 'join_or_create' => 'users#choose'
  get 'new_channel' => 'channels#show'
  
  #For user log in log out
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#new'
  
  #For menu
  get 'ameensadmin' => 'ameens_menus#new'
  post 'ameensadmin' => 'ameens_menu#create'
  get 'ameensmenu' => 'ameens_menus#show'

  
  resources :users
  resources :channels
  resources :ameens_menus
  end