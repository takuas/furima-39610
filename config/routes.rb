Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    collection do
      get 'search'
    end
    resources :comments, only: :create
    resources :orders, only: [:index, :create]
  end
end
