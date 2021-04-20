Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :wines, only: [:index, :show, :create, :edit, :update, :destroy]

  resources :users, only: [:index, :show, :edit, :update]
end
