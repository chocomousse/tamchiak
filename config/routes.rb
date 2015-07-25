Rails.application.routes.draw do
  
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'users#choose'

  #For channels
  get 'create_channel' => 'channels#new'
  get 'join_channel' => 'sessions#joining_a_channel' #shows that page I think
  post 'join_channel' => 'sessions#new_order'        #happens upon clicking the submit button in the joining_a_channel page
  get 'current_channel' => 'channels#show'
  delete 'sessions' => 'sessions#quit'
  get 'exit' => 'users#choose'
  get 'all_channels' => "channels#display"
  get 'channel' => 'channels#toggle_status'
  
  get 'add_item' => 'orders#new'
  post 'orders' => 'orders#create'
  get 'all_orders' => 'orders#show'
  delete 'orders' => 'orders#destroy'
  get "collate" => 'orders#collate'
  
  get 'bill' => 'channels#bill'
  get 'send_bill' => 'users#bill'
  
  #For user log in log out
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#new'
  get 'join_or_create' => 'users#choose'
  get 'about' => 'users#about'

  #For user profile
  get 'settings' => 'users#edit'
  
  # Admin Pages
  get 'admin' => 'users#admin'
  get 'admin_channels' => 'channels#admin_channels'
  delete 'channels' => 'channels#destroy'
  get 'admin_users' => 'users#admin_users'
  delete 'users' => 'users#destroy'
  
  resources :orders
  resources :users
  resources :channels
  resources :menu_items, only: [:index]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
