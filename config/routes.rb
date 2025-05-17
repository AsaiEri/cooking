Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'about' => 'homes#about', as: 'about'
  resources :cookings, only: [:create, :edit, :index, :show, :destroy, :update]
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
end