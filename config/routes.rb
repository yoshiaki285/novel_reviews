Rails.application.routes.draw do
  root to: 'homes#index'
  get 'books/search' => "books#search"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post '/users/guest_sign_in' => 'users/sessions#guest_sign_in'
  end
  resource :user, except: [:new, :create, :destroy] do
    collection do
      get :bookmarks
    end
  end
  resources :books, only: [:show] do
    resources :reviews do
      resources :comments, only: [:create, :destroy]
    end
    resource :bookmarks, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
