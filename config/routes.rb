Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  devise_for :users
  resources :experiments 
  get '/search' => "experiments#search"
end
