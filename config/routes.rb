# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  get 'overall', to: 'overall#default'
  get 'overall/:year', to: 'overall#index'
end
