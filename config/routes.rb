Rails.application.routes.draw do

  root 'home#index'
  get 'transfers/index'
  get 'transfers/new'
  get 'home/index'
  get 'categories/new'
  devise_for :users

  resources :categories do
  resources :transfers 
  end

  resources :categories, only: %i[:new :create :destroy] do
      resources :transfers, only: %i[:index :new :create destroy]
  end  
end
