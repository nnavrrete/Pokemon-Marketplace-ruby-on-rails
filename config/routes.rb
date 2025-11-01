Rails.application.routes.draw do
  namespace :api do
    resources :usuarios, only: [ :index, :create, :update, :destroy ]
    post "login", to: "sessions#create"
  end
end
