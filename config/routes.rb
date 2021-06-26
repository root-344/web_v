Rails.application.routes.draw do
 get 'posts', to: 'posts#index'
 root to: 'posts#index'
end
