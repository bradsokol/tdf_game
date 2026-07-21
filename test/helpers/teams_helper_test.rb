# typed: false
# frozen_string_literal: true

require 'test_helper'

class TeamsHelperTest < ActionView::TestCase
  extend T::Sig

  test '#team_main_site_url builds the main site team url' do
    player = Player.new(name: 'Jim Hopper')

    assert_equal 'https://ifarm.nl/cgi-bin/getpart.cgi?SEARCH=Jim+Hopper&YEAR=2019', team_main_site_url(2019, player)
  end

  test '#team_main_site_url escapes special characters in the team name' do
    player = Player.new(name: 'Café & Sons')

    assert_equal(
      'https://ifarm.nl/cgi-bin/getpart.cgi?SEARCH=Caf%C3%A9+%26+Sons&YEAR=2019',
      team_main_site_url(2019, player)
    )
  end
end
