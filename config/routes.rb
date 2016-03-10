Rails.application.routes.draw do

  get "/auth/facebook", as: "facebook"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users do
    resources :listings
    resources :reservations
  end

  resources :reservations do
     resources :transactions, only: [:new, :create]
  end

  resources :reservations
  resources :listings

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  root 'listings#index'

end
