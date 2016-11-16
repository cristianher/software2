Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :abouts
 # get 'welcome/index'
  resources :welcome
  resources :entrances
  resources :alerts
  resources :historia
  resources :information
  devise_for :admins
  resources :posts
  devise_for :users
  devise_for :alerts
  root "welcome#index"
end
