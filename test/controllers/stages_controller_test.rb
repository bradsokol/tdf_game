# frozen_string_literal: true

require 'test_helper'

class StagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get default' do
    get stages_default_url
    assert_response :success
  end

  test 'should get index' do
    get stages_index_url
    assert_response :success
  end
end
