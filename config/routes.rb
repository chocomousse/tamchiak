Rails.application.routes.draw do

  root 'sessions#new'
  
  #For channels
  get 'create_channel' => 'channels#new'
  get 'join_channel' => 'sessions#joining_a_channel' #shows that page I think
  post 'join_channel' => 'sessions#new_order'        #happens upon clicking the submit button in the joining_a_channel pageail

  get 'join_or_create' => 'users#choose'
  get 'new_order' => 'orders#new'
  
  #For user log in log out
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#new'
  
  #For user profile
  get 'settings' => 'users#edit'
  
  #For menu
  get 'ameensadmin' => 'ameens_menus#new'
  post 'ameensadmin' => 'ameens_menu#create'
  get 'ameensmenu' => 'ameens_menus#show'

  
  resources :users
  resources :channels
  resources :ameens_menus
  resources :orders,         only: [:create, :destroy]
  end