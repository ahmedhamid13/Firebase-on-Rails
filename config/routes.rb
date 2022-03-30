Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :posts
  resources :users
  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  mount Blazer::Engine, at: "blazer", as: 'blazer'
  root to: redirect('/dashboard', status: 302)
end
