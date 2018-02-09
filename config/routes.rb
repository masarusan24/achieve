Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :contacts
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show, :index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
