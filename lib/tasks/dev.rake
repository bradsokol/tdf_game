# frozen_string_literal: true

namespace :dev do
  desc 'Force reload of all results'
  task reload_results: :environment do
    abort 'YEAR must be specified' unless ENV['YEAR']

    Tour.find_by(year: ENV['YEAR']).stages.update_all(results_downloaded_at: nil)
  end
end
