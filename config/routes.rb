Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'borrow'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users 
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :possessions,         only: [:create, :destroy, :edit]
  resources :books
  resources :copies
  get 'search_books', to: 'search_books#search'
  get 'search_users', to: 'search_users#search'
  root                'static_pages#home'

end