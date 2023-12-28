# typed: true
# frozen_string_literal: true

module Admin
  class AuthenticatedController < ApplicationController
    extend T::Sig

    before_action :authenticate_user!
  end
end
