Rails.application.routes.draw do
  get 'ameens_menus/new'

  #get 'channels_sessions/new'
  #get 'ameens_menu/new'
  #get 'channels/new'
  root 'sessions#new'
  
  #For channels
  #get 'create_channel' => 'channels#new'
  #get 'join_channel' => 'channels_sessions#new'
  #post 'join_channel' => 'channels_sessions#create'
  #delete 'exit_channel' => 'channel_sessions#destroy'
  
  #For user log in log out
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'session#destroy'
  get 'logout' => 'sessions#new'
  
  resources :users
  #resources :channels
  #resources :ameens_menus
  end