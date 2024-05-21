Rails.application.routes.draw do
  get 'home/index'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  root 'home#index'
  devise_for :users, controllers: {
  omniauth_callbacks: "omniauth_callbacks"
  }
  resources :users, only: [:show, :edit, :update]
  resources :blogs do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :gears do
    resources :orders
  end
end