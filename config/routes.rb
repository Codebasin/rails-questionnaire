Rails.application.routes.draw do
  root "surveys#index"
  devise_for :users
end
