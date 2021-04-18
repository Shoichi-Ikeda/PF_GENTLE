Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :wines, only: %i[index show create edit update destroy]

  resources :users, only: [:index, :show, :edit, :update]
end
