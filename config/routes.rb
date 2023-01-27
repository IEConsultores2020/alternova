Rails.application.routes.draw do
  devise_for :users
  get 'update_joke', to: "chucknorris#update_joke", as: "update_joke"
  get 'home/index'
  get 'chucknorris/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :chucknorris
  # Defines the root path route ("/")
  root 'chucknorris#new'
end