Amarakosha::Application.routes.draw do
  root :to => 'synonym#find'

  get 'syn', to: 'synonym#find'
  match 'login', to: 'sessions#create', :via => [:get, :post], as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'users#new', as: 'signup'

  resources :synonym
  resources :users
  resources :sessions

  match '*a', :to => 'errors#routing', :via => [:get, :post], as: 'error'
end
