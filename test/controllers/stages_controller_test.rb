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

  test '#index redirects to first stage with results in default year when tour not found' do
    get '/stages/1900/1'

    assert_redirected_to '/stages/2019/3'
  end

  test '#index redirects to first stage with results in default year when stage not found' do
    get '/stages/2020/99'

    assert_redirected_to '/stages/2019/3'
  end

  test '#index shows message if stage is not a game stage' do
    get '/stages/2019/1'

    assert_select 'p', 'This stage is not part of the game.'
  end

  test '#index shows messages when results are not available' do
    get '/stages/2019/4'

    assert_response :success
    assert @response.body.include?('Stage results are not available. Check back later.')
  end
end
