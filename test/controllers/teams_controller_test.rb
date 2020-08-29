# frozen_string_literal: true

require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:tdf_2019)
    @first_player = Registration.where(year: @tour.year).joins(:player).order(:name).first.player
  end

  test '#default redirects to the first stage with results in most recent year' do
    get '/teams'

    most_recent_tour = Tour.all.order(:year).last
    assert_redirected_to "/teams/#{most_recent_tour.year}/#{@first_player.id}"
  end

  test '#index returns response' do
    get "/teams/#{@tour.year}/#{@first_player.id}"

    assert_response :success
    assert_select 'select[name=team]' do
      assert_select 'option[selected=selected]', 'Jim Hopper'
    end
  end

  test '#index redirects to most recent when tour not found' do
    get '/teams/1900/1'

    most_recent_tour = Tour.all.order(:year).last
    assert_redirected_to "/teams/#{most_recent_tour.year}/#{@first_player.id}"
  end

  test '#index redirects to default when player not found' do
    skip
    get "/teams/#{@tour.year}/1"

    assert_redirected_to "/teams/#{@tour.year}/#{@first_player.id}"
  end

  test '#index shows message when results are not available' do
    skip
    get "/teams/2020/#{@first_player.id}"

    assert_response :success
    assert @response.body.include?('The tour starts on August 29. Check back in 7 days.')
  end
end
