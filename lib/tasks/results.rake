# typed: true
# frozen_string_literal: true

T.bind(self, T.all(Rake::DSL, Object))

namespace :results do
  desc 'Delete results for a year'
  task delete: :environment do
    abort 'YEAR must be specified' unless ENV['YEAR']

    puts 'YOU ARE ABOUT TO DELETE ALL RESULTS. RE-ENTER THE YEAR TO CONFIRM.'
    confirm_year = $stdin.gets.chomp
    abort 'Aborting...' if confirm_year != ENV.fetch('YEAR', nil)

    tour = Tour.find_by(year: ENV.fetch('YEAR', nil))
    return if tour.nil?

    tour.stages.each do |stage|
      stage.stage_results.each { |stage_result| stage_result.player_rider_stage_points.destroy_all }
    end
    tour.riders.each { |rider| rider.player_rider_points.destroy_all }
    tour.overall_results.destroy_all
    tour.riders.destroy_all
    Registration.where(year: tour.year).destroy_all
    tour.stages.each { |stage| stage.stage_results.destroy_all }
    tour.stages.destroy_all
    tour.destroy!
  end

  desc 'Update results for stage'
  task update: :environment do
    abort 'STAGE number must be specified' unless ENV['STAGE']
    abort 'YEAR must be specified' unless ENV['YEAR']

    tour = Tour.find_by!(year: ENV.fetch('YEAR', nil))
    stage = tour.stages.find_by!(number: ENV.fetch('STAGE', nil))
    abort 'Stage must be a game stage' unless stage.game_stage?

    stage.update!(results_downloaded_at: nil) if ENV['FORCE']

    StageResultsUpdater.new.perform(stage.id)
  end

  desc 'Update results for all stages in a tour'
  task update_all: :environment do
    abort 'YEAR must be specified' unless ENV['YEAR']

    tour = Tour.find_by!(year: ENV.fetch('YEAR', nil))
    tour.stages.each do |stage|
      stage.update!(results_downloaded_at: nil) if ENV['FORCE']

      StageResultsUpdater.new.perform(stage.id)
    end
  end
end
