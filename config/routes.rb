Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spaceships, only: %i[index show new create edit update destroy] do
    resources :bookings, only: %i[index show new create destroy]
  end
end
