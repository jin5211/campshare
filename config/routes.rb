Rails.application.routes.draw do
  root to: "blogs#index"
  devise_for :users, controllers: {
  omniauth_callbacks: "omniauth_callbacks"
  }
  resources :blogs do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :gears do
    resources :orders
  end
end