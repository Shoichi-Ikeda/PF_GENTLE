Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  get '/search' => 'goods#search', as: 'search'

  resources :users, only: %i[index show edit update destroy]
  resources :wines, only: %i[index show create destroy] do
    resource :cheers, only: %i[create destroy]
    resources :post_comments, only: %i[create destroy]
  end
end
