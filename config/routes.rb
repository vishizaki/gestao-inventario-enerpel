Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :raw_materials
  # root to: "raw_materials#index"
  patch 'add', to: 'pages#add_quantity', as: :add_quantity
  patch 'subtract', to: 'pages#subtract_quantity', as: :subtract_quantity
  patch 'opgw_box', to: 'pages#sell_opgw_box', as: :sell_opgw_box
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
