# typed: false
# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    get 'results', to: 'results#index'
    post 'results', to: 'results#update'
  end

  root to: 'overall#index'

  get 'overall', to: 'overall#default'
  get 'overall/:year', to: 'overall#index'

  get 'stages', to: 'stages#default'
  get 'stages/:year', to: 'stages#index'
  get 'stages/:year/:stage', to: 'stages#index'

  get 'teams', to: 'teams#default'
  get 'teams/:year', to: 'teams#index'
  get 'teams/:year/:player', to: 'teams#index'
end
