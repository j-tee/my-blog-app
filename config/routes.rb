Rails.application.routes.draw do
  devise_for :members
  root 'users#index'  
  resources :users, only: [:index, :show], format: 'json' do
    resources :posts, only: [:index, :show, :new, :create, :destroy], format: 'json' do
      resources :comments, only: [:index, :create, :destroy], format: 'json'
      resources :likes, only: [:create]
    end
  end
end
