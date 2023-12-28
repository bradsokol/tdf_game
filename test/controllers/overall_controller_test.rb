# typed: true
# frozen_string_literal: true

require 'test_helper'

class OverallControllerTest < ActionDispatch::IntegrationTest
  extend T::Sig

  test '#default redirects to the most recent year' do
    get '/overall'

    assert_redirected_to '/overall/2020'
  end

  test '#index returns response' do
    get '/overall/2019'

    assert_response :success
    assert_select 'p', 'Results up to July 11, 2019'
  end

  test '#index shows message when no results available' do
    travel_to(Date.new(2020, 8, 22)) do
      get '/overall/2020'
    end

    assert_response :success
    assert_select 'p', 'The tour starts on August 29. Check back in 7 days.'
  end

  test '#index redirects to most recent year if requested tour not found' do
    get '/overall/1900'

    assert_redirected_to '/overall/2020'
  end
end
