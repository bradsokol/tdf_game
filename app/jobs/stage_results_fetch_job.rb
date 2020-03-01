# frozen_string_literal: true

class StageResultsFetchJob < ApplicationJob
  queue_as :default

  def perform(stage_id)
    stage = Stage.find(stage_id)
    Rails.logger.info("Updating stage results for stage #{stage.date} (id: #{stage.id})")

    players = Player.find(Registration.where(year: stage.tour.year).pluck(:player_id))

    return unless update_stage_results(players, stage)

    Rails.logger.info("Updated stage results for #{players.length} players for stage #{stage.date} (id: #{stage.id})")
  end

  private

  def update_stage_result(player, stage)
    overall_result = OverallResult.find_or_create_by(player_id: player.id, tour_id: stage.tour.id)
    stage_result = StageResult.find_or_create_by(player_id: player.id, stage_id: stage.id)
    StageResultsFetcher.perform(
      stage_date: stage.date,
      player_name: player.name,
      overall_result: overall_result,
      stage_result: stage_result
    )
    overall_result.save!
    stage_result.save!
  end

  def update_stage_results(players, stage)
    StageResult.transaction do
      players.each do |player|
        update_stage_result(player, stage)
      end

      stage.update!(results_downloaded_at: Time.now.utc)
    end
    true
  rescue StandardError => e
    Rails.logger.error("Failed to update stage result: #{e.message}")
    false
  end
end
