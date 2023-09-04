Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :items do
    collection do
      get 'search'
    end
    resources :comments,  only: :create
    resources :orders,    only: [:index, :create]
    resource  :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
end
