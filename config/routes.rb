Rails.application.routes.draw do
  devise_for :users


  # This is for when order are created
  # resources :toys do
  #   resources :orders, only: [:new, :create]
  # end
  # get 'pages/about'
  # get 'pages/contact'
  # get 'seller' => "toys#seller"
  # get 'sales' => "orders#sales"
  # get 'purchases' => "orders#purchases"

  resources :toys
  root 'toys#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
