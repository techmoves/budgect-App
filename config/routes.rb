Rails.application.routes.draw do
  get 'transactions/new'
  get 'home/index'
  get 'categories/new'
  devise_for :users

  resources :transactions, only: [:index, :new ]

end
