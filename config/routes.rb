Rails.application.routes.draw do
  devise_for :users
  get '/about' => 'static_pages#about'
  get '/lookup' => 'static_pages#lookup'
  post '/lookup' => 'static_pages#lookup'
  root to: "home#index"
end
