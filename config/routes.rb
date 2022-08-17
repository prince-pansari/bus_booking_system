Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :route, only: %i(show) do
      get :get_all_routes, on: :collection
    end
    resources :bus, only: %i() do
      get :get_bus_detail, on: :collection, to: 'bus#get_bus_detail'
    end

    resources :ticket, only: %i() do
      post :book_ticket, on: :collection, to: 'ticket#book_ticket'
      get :get_tickets, on: :collection, to: 'ticket#get_tickets'
    end

    resources :user, only: %i() do
      post :login, on: :collection, to: 'user#login'
    end
  end
end
