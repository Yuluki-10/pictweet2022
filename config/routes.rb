Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  # get 'tweets' => 'tweets#index'
  # get 'tweets/new' => 'tweets#new'
  # post 'tweets' => 'tweets#create'
  # get 'tweets/:id/edit' => 'tweets#edit'
  # patch 'tweets/:id' => 'tweets#update'
  # delete 'tweets/:id' => 'tweets#destroy'
  # get 'users/:id' => 'users#show'
  # get 'tweets/:id' => 'tweets#show'
end
