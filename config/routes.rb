Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy] #like_idを含まない形になる
  end
  resources :users, only: [:show]
  resources :categories do
    get 'tweets', to: 'tweets#search'
  end
end