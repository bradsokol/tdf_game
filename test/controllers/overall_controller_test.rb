require 'test_helper'

class OverallControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get overall_index_url
    assert_response :success
  end

end
