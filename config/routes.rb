Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :experiments 
  
  root 'welcome#index'
  get '/search' => "experiments#search"
end
