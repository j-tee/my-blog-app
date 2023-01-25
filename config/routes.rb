Rails.application.routes.draw do
  root 'users#index'
  get 'users/:user_id' => 'users#show'
  get '/users/:user_id/posts/:post_id', to: 'posts#show'
  get '/users/:user_id/posts', to: 'posts#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
