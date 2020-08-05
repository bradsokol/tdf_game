# frozen_string_literal: true

Rails.application.routes.draw do
  get 'overall', to: 'overall#default'
  get 'overall/:year', to: 'overall#index'

  get 'stages', to: 'stages#default'
  get 'stages/:year', to: 'stages#index'
  get 'stages/:year/:stage', to: 'stages#index'
end
