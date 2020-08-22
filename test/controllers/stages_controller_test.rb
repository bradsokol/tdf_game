# frozen_string_literal: true

require 'test_helper'

class StagesControllerTest < ActionDispatch::IntegrationTest
  test '#default redirects to the first stage with results in default year' do
    get '/stages'

    assert_redirected_to '/stages/2019/3'
  end

  test '#index returns response' do
    get '/stages/2019/3'

    assert_response :success
    assert_select 'select[name=stage]' do
      assert_select 'option[selected=selected]', 'Stage 3 - July  8 - Binche to Épernay - 215 km'
    end
  end
end
