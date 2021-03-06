Rails.application.routes.draw do
  get 'braintree/new'


  post 'braintree/checkout' => 'braintree#checkout'

  get 'static_pages/landing'
  post '/search' => 'listings#search', as: :search
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users do
    resources :reservations, only: [:index]
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback"=>"sessions#create_from_omniauth"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'listings#index'

  resources :listings do 
    resources :reservations,only: [:create]
  end
  resources :reservations, only: [:destroy]
  


end

