# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  get '/search' => 'goods#search'
  get '/research' => 'search#research'

  resources :users, only: %i[index show edit update destroy]
  resources :wines, only: %i[index show create destroy] do
    resource :cheers, only: %i[create destroy]
    resources :post_comments, only: %i[create destroy]
  end
end
