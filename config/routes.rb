Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :repositories, only: [:index]
  root to: "repositories", controller: "repositories", action: "index"
end
