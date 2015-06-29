Rails.application.routes.draw do
  
  #get 'channels_sessions/new'
  #get 'channels/new'
  root 'sessions#new'
  
  #For channels
  get 'create_channel' => 'channels#new'
  get 'join_channel' => 'csessions#new'
  post 'join_channel' => 'csessions#create'
  delete 'exit_channel' => 'csessions#destroy'
  get 'join_or_create' => 'users#choose'
  get 'new_channel' => 'channels#show'
  
  #For user log in log out
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'session#destroy'
  get 'logout' => 'sessions#new'
  
  #For menu
  get 'ameens_menus/new'
  get 'ameensadmin' => 'ameens_menus#new'
  get 'ameens_menus' => 'ameens_menus#show'

  
  resources :users
  resources :channels
  resources :ameens_menus
  end