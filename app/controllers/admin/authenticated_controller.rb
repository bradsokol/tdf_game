# frozen_string_literal: true

module Admin
  class AuthenticatedController < ApplicationController
    before_action :authenticate_user!
  end
end
