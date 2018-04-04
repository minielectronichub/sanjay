Rails.application.routes.draw do

  devise_for :users
  resources :experiments
  root 'welcome#index'
  match 'show' => 'experiments#show',:as => :video
  get '/search' => "experiments#search"
end
