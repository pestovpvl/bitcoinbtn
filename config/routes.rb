Rails.application.routes.draw do
  resources :cryptos
  devise_for :people
  devise_for :users
  get '/lookup' => 'static_pages#lookup'
  post '/lookup' => 'static_pages#lookup'
  root to: "home#index"
end
