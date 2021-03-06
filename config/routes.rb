Rails.application.routes.draw do
  resources :coins
  resources :cryptos
  devise_for :people
  devise_for :users
  get '/about' => 'static_pages#about'
  get '/history' => 'static_pages#history'
  get '/lookup' => 'static_pages#lookup'
  post '/lookup' => 'static_pages#lookup'
  root to: "home#index"
end
