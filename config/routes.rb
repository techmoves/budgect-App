# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :categories, only: %i[new create destroy] do
    resources :entities, only: %i[index new create destroy]
  end
end
