Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  defaults format: :json do
    resources :tasks, only: %i[index create show update destroy]
    resources :users, only: %i[index create show update destroy]
  end
end
