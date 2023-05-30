Rails.application.routes.draw do
  devise_for :users

  resources :toys do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:update]
  # get 'pages/about'
  # get 'pages/contact'
  # get 'seller' => "toys#seller"
  get 'sales' => "orders#sales"
  # get 'purchases' => "orders#purchases"

  root 'toys#index'
end
