# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_year

  def set_year
    @year = params[:year]
  end
end
