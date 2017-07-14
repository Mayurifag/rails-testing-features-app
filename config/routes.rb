Rails.application.routes.draw do
  resources :mori_cinema_todays
  resources :movies
  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact
  devise_for :users
  root to: 'movies#index'
end
