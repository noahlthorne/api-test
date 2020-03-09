Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users

  root to: 'posts#index'
  resources :posts
  resources :users, only: [:index, :show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index, :show, :update, :create, :destroy]
      resources :users, only: [:index, :show]
    end
  end

end
