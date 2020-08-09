# frozen_string_literal: true

require 'test_helper'

class OverallControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/overall/2019'
    assert_response :success
  end
end
