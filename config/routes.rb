Project::Application.routes.draw do
  get "others/search"
  get "others/assign"
  devise_for :users
  resources :transactions
  resources :accounts
  root :to=> 'accounts#index'
    
end
