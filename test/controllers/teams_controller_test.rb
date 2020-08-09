# frozen_string_literal: true

require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test 'should get default' do
    get teams_default_url
    assert_response :success
  end

  test 'should get index' do
    get teams_index_url
    assert_response :success
  end
end
