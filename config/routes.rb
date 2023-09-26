Rails.application.routes.draw do

  root 'home#index'
  get 'transfers/index'
  get 'transfers/new'
  get 'transactions/new'
  get 'home/index'
  get 'categories/new'
  devise_for :users

  resources :transactions, only: [:index, :new ]

end
