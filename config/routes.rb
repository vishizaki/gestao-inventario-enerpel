Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # resources :raw_materials
  resources :inventories, only: [:edit, :update]
  resources :raw_materials
  # root to: "raw_materials#index"
  patch 'add', to: 'pages#add_quantity', as: :add_quantity
  patch 'subtract', to: 'pages#subtract_quantity', as: :subtract_quantity
  patch 'sell_product', to: 'pages#sell_product', as: :sell_product
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
