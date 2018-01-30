Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :contacts
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
