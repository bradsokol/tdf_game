# typed: true
# frozen_string_literal: true

class StageResultsUpdater
  extend T::Sig

  attr_reader :stage

  sig { params(stage_id: Integer).void }
  def perform(stage_id)
    @stage = Stage.find(stage_id)

    Rails.logger.info("Updating stage results for stage #{stage.date} (id: #{stage.id})")

    players = Player.find(Registration.where(year: stage.tour.year).pluck(:player_id))

    return unless update_stage_results(players, stage)

    Rails.logger.info("Updated stage results for #{players.length} players for stage #{stage.date} (id: #{stage.id})")
  end

  private

  sig { params(player: Player, stage: Stage).void }
  def update_stage_result(player, stage)
    overall_result = OverallResult.find_or_create_by(player_id: player.id, tour_id: T.must(stage.tour).id)
    stage_date = T.must(stage.date)

    # TODO: Fix this hack
    @save_overall = overall_result.new_record? || stage_date > overall_result.date

    stage_result = StageResult.find_or_create_by(player_id: player.id, stage_id: stage.id)
    StageResultsFetcher.perform(
      stage_date:,
      player_name: T.must(player.name),
      overall_result:,
      stage_result:
    )
    overall_result.save! if @save_overall
    stage_result.save!

    update_team_result(player, stage_result, overall_result)
  end

  sig { params(players: T::Array[Player], stage: Stage).returns(T::Boolean) }
  def update_stage_results(players, stage)
    StageResult.transaction do
      players.each do |player|
        update_stage_result(player, stage)
      end

      stage.update!(results_downloaded_at: Time.now.utc)
    end
    true
  rescue StandardError => e
    Rails.logger.error("Failed to update stage result: #{e.message}\n#{T.must(e.backtrace).join("\n")}")
    false
  end

  sig { params(player: Player, stage_result: StageResult, overall_result: OverallResult).void }
  def update_team_result(player, stage_result, overall_result)
    results = TeamResultsFetcher.perform(year: stage.tour.year, player_name: T.must(player.name))

    results.riders.each do |rider_results|
      rider = stage.tour.riders.find_or_create_by(name: rider_results.name)
      player_rider_points = overall_result.player_rider_points.find_or_create_by(rider:)
      player_rider_points.update!(ordinal: rider_results.ordinal, points: rider_results.total_points)

      player_rider_stage_points = stage_result.player_rider_stage_points.find_or_create_by(rider:)
      player_rider_stage_points.update!(points: rider_results.stage_points[stage.number])
    end

    stage_result.update!(percentile: results.stage_percentiles[stage.number])
    overall_result.update!(percentile: results.overall_percentile) if @save_overall
  end
end
