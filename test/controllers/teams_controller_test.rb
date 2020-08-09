# frozen_string_literal: true

require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test 'should get default' do
    get '/teams'
    assert_response :redirect
  end

  test 'should get index' do
    tour = tours(:tdf_2019)
    player = Registration.where(year: tour.year).joins(:player).order(:name).first.player
    get "/teams/#{tour.year}/#{player.id}"
    assert_response :success
  end
end
