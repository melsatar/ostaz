Project::Application.routes.draw do
  resources :transactions
  resources :accounts
  root :to=> 'accounts#index'
  get "others/search"
  get "others/assign"
  devise_for :users
end
