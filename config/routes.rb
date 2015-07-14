Rails.application.routes.draw do

  get 'ameens/new'

  root 'sessions#new'
  
  #For channels
  get 'create_channel' => 'channels#new'
  get 'join_channel' => 'sessions#joining_a_channel' #shows that page I think
  post 'join_channel' => 'sessions#new_order'        #happens upon clicking the submit button in the joining_a_channel pageail
  get 'new_channel' => 'channels#show'
  delete 'exit' => 'sessions#quit'
  get 'exit' => 'users#choose'
  get 'all_channels' => "channels#display"

  get 'join_or_create' => 'users#choose'
  #get 'new_order' => 'orders#new'
  #get 'order_received' => 'orders#show'
  
  #For user log in log out
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#new'
  
  #For user profile
  get 'settings' => 'users#edit'
  
  #For menu
  get 'ameens_admin' => 'ameens#new'
  post 'ameens_admin' => 'ameens#create'
  get 'ameens_menu' => 'ameens#show'
  
  #For menu which annabel changed to orders -_- hehehe kidding
  get 'ameensadmin' => 'ameens_menus#new'
  post 'ameensadmin' => 'ameens_menus#create'
  get 'ameensmenu' => 'ameens_menus#show'

  resources :users
  resources :channels
  resources :ameens
  resources :ameens_menus,    only: [:create, :destroy]
  resources :orders,         only: [:create, :destroy]
  end