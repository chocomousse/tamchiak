Rails.application.routes.draw do
  
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'

  get 'carts/show'

  get 'items/index'

  get 'ameens/new'

  root 'sessions#new'

  #For channels
  get 'create_channel' => 'channels#new'
  get 'join_channel' => 'sessions#joining_a_channel' #shows that page I think
  post 'join_channel' => 'sessions#new_order'        #happens upon clicking the submit button in the joining_a_channel page
  get 'new_channel' => 'channels#show'
  delete 'exit' => 'sessions#quit'
  get 'exit' => 'users#choose'
  get 'all_channels' => "channels#display"
  
  get 'create_order' => 'orders#new'
  post 'create_order' => 'orders#create'
  get 'order_received' => 'orders/order_created'
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

  #For menu
  get 'ameens_admin' => 'ameens#new'
  post 'ameens_admin' => 'ameens#create'
  get 'ameens_menu' => 'ameens#show'

  #For menu which annabel changed to orders -_- hehehe kidding => cuz szeying didnt tell me what she wanted to do mah 
  get 'ameensadmin' => 'ameens_menus#new'
  post 'ameensadmin' => 'ameens_menus#create'
  get 'ameensmenu' => 'ameens_menus#show'

  resources :users
  resources :channels
  resources :ameens
  resources :ameens_menus,    only: [:create, :destroy]
  resources :orders,         only: [:create, :destroy]
  resources :account_activations, only: [:edit]
end
