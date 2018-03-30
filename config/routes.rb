Rails.application.routes.draw do
  


  devise_for :users
  resources :experiments

 
 get '/lab' => "labs#new"
 get '/search' => "experiments#search"
end
