Rails.application.routes.draw do

  root to: 'homes#top'
  get 'books/search' => "books#search"
  devise_for :users
  resource :user, except: [:new, :create, :destroy]
  resources :books, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
