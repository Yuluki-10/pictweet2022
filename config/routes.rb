Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  get 'tweets' => 'tweets#index'
  get 'tweets/new' => 'tweets#new'
  post 'tweets' => 'tweets#create'
  get 'tweets/:id/edit' => 'tweets#edit'
  patch 'tweets/:id' => 'tweets#update'
  delete 'tweets/:id' => 'tweets#destroy'
  get 'users/:id' => 'users#show'
  get 'tweets/:id' => 'tweets#show'
end
