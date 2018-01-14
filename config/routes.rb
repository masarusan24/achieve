Rails.application.routes.draw do
  root to: 'blogs#index'
  resources :contacts
  resources :blogs
end
