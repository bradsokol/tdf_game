# typed: true
# frozen_string_literal: true

module TeamsHelper
  extend T::Sig

  sig { params(points: T.nilable(Integer)).returns(String) }
  def format_points(points)
    if points.nil?
      '-'
    elsif points.zero?
      ''
    else
      points.to_s
    end
  end

  sig { params(players: T::Array[Player]).returns(T::Array[[String, Integer]]) }
  def options_from_players(players)
    players.map { |player| [T.must(player.name), T.must(player.id)] }
  end

  sig { params(stage: Stage, player: Player).returns(StageResult) }
  def stage_results_for_player(stage, player)
    stage.stage_results.where(player:).first
  end
end
