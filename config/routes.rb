Rails.application.routes.draw do
 get "posts/index" => "posts#index"
 root to: 'posts#index'
 resources :posts, only: [:index, :new, :create]
 post "posts/create" => "posts#create"
end
