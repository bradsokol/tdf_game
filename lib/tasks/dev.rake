# frozen_string_literal: true

namespace :dev do
  namespace :results do
    desc 'Clear all results'
    task clear: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      tour = Tour.find_by!(year: ENV['YEAR'])
      tour.overall_results.delete_all
      tour.stages.each { |stage| stage.stage_results.delete_all }
      tour.stages.update_all(results_downloaded_at: nil)

      OverallResult.where(tour: nil).delete_all
    end

    desc 'Force reload of all results'
    task reload: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      Tour.find_by!(year: ENV['YEAR']).stages.update_all(results_downloaded_at: nil)
    end

    desc 'Show result syncing status'
    task status: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      tour = Tour.find_by!(year: ENV['YEAR'])
      puts 'Last update time of overall results by ID and player ID:'
      tour.overall_results.order(:player_id).each do |result|
        puts format("%4d %4d: #{format_time(result.updated_at)}", result.id, result.player_id)
      end

      puts "\nResults fetch time by stage ID number and date:"
      tour.stages.order(:date).each do |stage|
        puts format("%4d %2d #{stage.date}: #{format_time(stage.results_downloaded_at)}", stage.id, stage.number)
      end
    end

    def format_time(time)
      return time unless time

      time.in_time_zone(Time.zone.name).strftime('%Y-%m-%d %H:%M:%S')
    end
  end
end
