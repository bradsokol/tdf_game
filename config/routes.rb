# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'

  get '*page', to: 'static#index', constraints: ->(request) { !request.xhr? && request.format.html? }

  root 'static#index'
end
