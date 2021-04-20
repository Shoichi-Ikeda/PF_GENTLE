Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :wines, only: [:index, :show, :create, :destroy]
    resource :cheers, only: [:create, :destroy]
    
end
