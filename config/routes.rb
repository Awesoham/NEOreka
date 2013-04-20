NEOreka::Application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  resources :users 
  resources :neos

  match 'users/:id/neos' => 'neos#neos_of'
end
