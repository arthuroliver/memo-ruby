Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :flashcards, only: [:index, :create, :update, :destroy]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
