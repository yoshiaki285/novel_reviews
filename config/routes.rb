Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index, :edit, :update]
  end
  # User
  devise_for :user, controllers: {
    registrations: 'user/registrations',
    passwords: 'user/passwords',
    sessions: 'user/sessions'
  }
  
  devise_scope :user do
    get '/user/edit' => 'user/users#edit'
    post '/user/guest_sign_in' => 'user/sessions#guest_sign_in'
  end
  
  scope module: :user do
    resource :user, except: [:new, :create, :destroy] do
      collection do
        get :bookmarks
      end
    end
    get 'books/search' => "books#search"
    get 'books/search_genre' => "books#search_genre"
    resources :books, only: [:show] do
      resources :reviews do
        resources :comments, only: [:create, :destroy]
      end
      resource :bookmarks, only: [:create, :destroy]
    end
    root to: 'homes#index'
  end

  # Admin
  namespace :admin do
    get '/index' => 'homes#index'
  
    resources :reviews, only: [:show,:destroy] do
      resources :comments, only: [:destroy]
    end
  end
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
