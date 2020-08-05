# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  get 'overall/:year', to: 'overall#index'
end
