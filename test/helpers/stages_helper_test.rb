# typed: false
# frozen_string_literal: true

require 'test_helper'

class StagesHelperTest < ActionView::TestCase
  extend T::Sig

  test '#stage_main_site_url builds the main site stage url' do
    stage = stages(:tdf_2019_3)

    assert_equal 'https://ifarm.nl/tdf/20190708.html', stage_main_site_url(stage)
  end
end
