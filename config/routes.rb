NEOreka::Application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  resources :users

  match 'neos/random' => 'neos#random'
  match '/about' => 'dashboard#about'
  resources :neos do
    resources :observations
  	member do
  		get :vote_up
  		get :vote_down
  	end
  	post :random
  end		
  resources :observations
  
  match 'users/:id/neos' => 'neos#neos_of'

end
