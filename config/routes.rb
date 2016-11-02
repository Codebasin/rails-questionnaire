Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :surveys do
    resources :questions do
    end
  end

  resources :answers, only: [:create]
  resources :users, only: [:show]

  root "surveys#index"

end
