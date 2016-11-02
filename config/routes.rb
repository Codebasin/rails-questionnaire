Rails.application.routes.draw do
  root "surveys#index"
  devise_for :users

  resources :surveys do
    resources :questions do
      resources :answers
    end
  end

end
