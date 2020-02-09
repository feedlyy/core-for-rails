Rails.application.routes.draw do
  # get login token from knock
  post 'user_token' => 'user_token#create'

  post 'login', to: 'home#create'
  resources :user
  resources :product
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
