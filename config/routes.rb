Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :contacts
  resources :blogs do
    resources :comments
    collection do
      post :confirm
    end
  end
  resources :users, param: :name
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
