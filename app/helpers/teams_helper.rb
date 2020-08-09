# frozen_string_literal: true

module TeamsHelper
  def format_points(points)
    if points.nil?
      '-'
    elsif points.zero?
      ''
    else
      points
    end
  end

  def options_from_players(players)
    players.map { |player| [player.name, player.id] }
  end

  def stage_results_for_player(stage, player)
    stage.stage_results.where(player: player).first
  end
end
