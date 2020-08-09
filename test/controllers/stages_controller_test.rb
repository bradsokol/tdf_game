# frozen_string_literal: true

require 'test_helper'

class StagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get default' do
    get '/stages'
    assert_response :redirect
  end

  test 'should get index' do
    get '/stages/2019/3'
    assert_response :success
  end
end
