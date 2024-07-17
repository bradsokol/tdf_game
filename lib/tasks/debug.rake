# typed: false
# frozen_string_literal: true

desc 'Task to run debugging code'
task debug: :environment do
  tour = Tour.find_by(year: 2024)
  stage12 = tour.stages.where(number: 12).first
  ross = Player.find(10)
  overall_result = OverallResult.find_by(player: ross, tour:)
  stage_result = StageResult.find_by(player: ross, stage: stage12)
  stage_points = stage_result.player_rider_stage_points.order(points: :desc)

  overall_result.player_rider_points.order(:ordinal).each do |prp|
    prsp = stage_result.player_rider_stage_points.where(rider_id: prp.rider_id).first
    puts "#{prp.rider.name} #{prsp.points}"
  end
end
