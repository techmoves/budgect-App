Rails.application.routes.draw do

  root 'home#index'
  get 'transfers/index'
  get 'transfers/new'
  get 'home/index'
  get 'categories/new'
  devise_for :users

resources :categories, only: [:new, :create, :destroy] do
  resources :transfers, only: [:index, :new, :create, :destroy]
end

end
