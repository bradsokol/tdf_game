# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"

  namespace :api, defaults: { format: 'json' } do
    get 'things', to: 'things#index'
  end

  get '*page', to: 'static#index', constraints: ->(request) { !request.xhr? && request.format.html? }

  root 'static#index'
end
