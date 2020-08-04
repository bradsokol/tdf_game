# frozen_string_literal: true

namespace :results do
  desc 'Update results for stage'
  task update: :environment do
    abort 'STAGE number must be specified' unless ENV['STAGE']
    abort 'YEAR must be specified' unless ENV['YEAR']

    tour = Tour.find_by!(year: ENV['YEAR'])
    stage = tour.stages.find_by!(number: ENV['STAGE'])
    abort 'Stage must be a game stage' unless stage.game_stage?

    stage.update!(results_downloaded_at: nil) if ENV['FORCE']

    StageResultsUpdater.new.perform(stage.id)
  end
end
