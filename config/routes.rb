Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :route, only: %i(show), format: "json" do
      get :get_all_routes, on: :collection
    end
  end
end
