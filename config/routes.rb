Rails.application.routes.draw do
  


  devise_for :users
  resources :experiments
  root 'welcome#index'
  get '/search' => "experiments#search"
end
