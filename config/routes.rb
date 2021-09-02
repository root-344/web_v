Rails.application.routes.draw do
  root to: 'posts#index'

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get 'users/index' => "users#index"
  get 'users/:id' => 'users#show'
  get "posts/index" => "posts#index"
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  resources :posts do
    resources :comments, only: :create
  end
    
end
