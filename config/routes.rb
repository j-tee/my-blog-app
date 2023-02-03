Rails.application.routes.draw do
  devise_for :members
  root 'users#index'  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
  # root 'users#index'
  # get 'users/:user_id', to: 'users#show', as: 'user'
  # get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # get '/users/:user_id/posts/:post_id', to: 'posts#show', as: 'user_post'
  # get '/users/:user_id/new', to: 'posts#new', as: 'new_user_post'
end
