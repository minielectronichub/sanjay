Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  member do 
    put :publish 
  end
  devise_for :users
  resources :experiments 
  
  root 'welcome#index'
  get '/search' => "experiments#search"
end
