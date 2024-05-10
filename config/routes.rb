Rails.application.routes.draw do
  root to: "blogs#index"
  devise_for :users
  resources :blogs
end