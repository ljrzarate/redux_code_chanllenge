Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :posts do
    resources :comments
    resource :likes, only: [:update]
  end

end
