Rails.application.routes.draw do

  root to: 'homes#top'
  get 'books/search' => "books#search"
  devise_for :users
  resource :user, except: [:new, :create, :destroy] do
    collection do
      get :bookmarks
    end
  end
  resources :books, only: [:show] do
    resource :bookmarks, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
