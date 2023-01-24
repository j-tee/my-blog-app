Rails.application.routes.draw do
  root 'users#index'
  get 'users/:user_id' => 'users#show', :defaults => { format: 'html' }, as: :user
  get '/users/:user_id/posts/:post_id', to: 'users#user_post', as: 'user_post'
  get '/users/:user_id/posts', to: 'users#user_posts', as: 'user_posts'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
