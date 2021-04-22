Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  get 'goods/search'

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :wines, only: [:index, :show, :create, :destroy] do
    resource :cheers, only: [:create, :destroy]
    resources :post_comments, only:[:create, :destroy]
  end
end
