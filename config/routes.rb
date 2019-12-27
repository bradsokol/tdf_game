# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    get 'things', to: 'things#index'
  end

  get '*page', to: 'static#index', constraints: ->(request) { !request.xhr? && request.format.html? }

  root 'static#index'
end
