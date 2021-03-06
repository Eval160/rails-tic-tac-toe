Rails.application.routes.draw do
  devise_for :users
  root to: 'parties#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parties, only: [:show, :create] do
    resources :moves, only: [:create]
  end
end
