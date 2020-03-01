# frozen_string_literal: true

namespace :dev do
  desc 'Clear all results'
  task clear_results: :environment do
    abort 'YEAR must be specified' unless ENV['YEAR']

    tour = Tour.find_by!(year: ENV['YEAR'])
    tour.overall_results.delete_all
    tour.stages.each { |stage| stage.stage_results.delete_all }
  end

  desc 'Force reload of all results'
  task reload_results: :environment do
    abort 'YEAR must be specified' unless ENV['YEAR']

    Tour.find_by!(year: ENV['YEAR']).stages.update_all(results_downloaded_at: nil)
  end
end
