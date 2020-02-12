Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  # get "/users", to: "home#users"
  # get "/sign_in", to: "home#sign_in"
  # get "/sign_out", to: "home#sign_out"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
