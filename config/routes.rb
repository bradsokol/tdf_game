# frozen_string_literal: true

Rails.application.routes.draw do
  get 'overall', to: 'overall#default'
  get 'overall/:year', to: 'overall#index'
end
