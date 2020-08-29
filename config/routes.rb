# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # devise_for :admin, path_names: { sign_in: 'login', sign_out: 'lougout' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

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
