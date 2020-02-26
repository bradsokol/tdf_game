# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'

  get '*page', to: 'static#index', constraints: ->(request) { !request.xhr? && request.format.html? }

  root 'static#index'
end
