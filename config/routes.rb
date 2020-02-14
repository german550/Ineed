Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/favorites', to: "favorites#index", as: 'favorites'
  resources :projects do
    resources :favorites, only: [:create, :destroy]
    get :my_projects, on: :collection
    get :my_favorites, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
