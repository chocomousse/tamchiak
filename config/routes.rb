Rails.application.routes.draw do
  
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'sessions#new'

  #For channels
  get 'create_channel' => 'channels#new'
  get 'join_channel' => 'sessions#joining_a_channel' #shows that page I think
  post 'join_channel' => 'sessions#new_order'        #happens upon clicking the submit button in the joining_a_channel page
  get 'current_channel' => 'channels#show'
  delete 'exit' => 'sessions#quit'
  get 'exit' => 'users#choose'
  get 'all_channels' => "channels#display"
  
  get 'orders' => 'orders#new'
  post 'orders' => 'orders#create'
  #get 'order_received' => 'orders#order_created'
  get 'all_orders' => 'orders#show'
  
  #For user log in log out
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#new'
  get 'join_or_create' => 'users#choose'

  #For user profile
  get 'settings' => 'users#edit'
  
  resources :users
  resources :channels
  resources :orders #,         only: [:create, :update, :destroy]
  resources :menu_items, only: [:index]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
