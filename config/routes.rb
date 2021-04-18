Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :profile, only: [:index]
  resources :posts, only: [:create] do
    resources :comments, only: [:index, :create]
    resource :likes, only: [:update]
  end

end
