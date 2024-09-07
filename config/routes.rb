Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root 'static_pages#index'
  get 'terms_of_use', to: 'static_pages#terms_of_use'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  resources :users, only: %i[new create]
  resources :posts, only: %i[new create index show edit update destroy] do
    collection do
      get :favorites
      get 'tag/:tag_name', to: 'posts#tag', as: :tag
    end
  end
  resources :favorites, only: %i[create destroy]

  #get 'static_pages/test', to: 'static_pages#test', as: :static_pages_test
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
