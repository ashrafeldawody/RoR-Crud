Rails.application.routes.draw do
  resources :posts
  root "home#index"
  post "register", to: "users#register"
  get "register", to: "users#register_form"
  post "login", to: "users#login"
  get "login", to: "users#login_form"
  post "logout", to: "users#logout"
end