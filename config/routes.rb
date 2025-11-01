Rails.application.routes.draw do
  namespace :api do
    resources :usuarios, only: [ :index, :create, :update, :destroy ]
    post "login", to: "sessions#create"
    resources :cartas, only: [ :index, :show, :create ]
    resources :publicaciones, only: [ :index, :create, :show, :destroy ]
    get "/cartas/:id/historial", to: "cartas#historial"
    resources :compras, only: [ :create ]
  end
end
