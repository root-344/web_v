Rails.application.routes.draw do
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get 'users/index'
  get 'users/:id' => 'users#show'
  get "posts/index" => "posts#index"
  root to: 'posts#index'
  resources :posts
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
end
