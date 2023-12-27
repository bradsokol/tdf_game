# frozen_string_literal: true

namespace :dev do
  namespace :players do
    desc 'Dump all players for a tour'
    task dump: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      year = ENV.fetch('YEAR')

      json = {
        year:,
      }

      json[:players] = Registration
                       .includes(:player)
                       .where(year:)
                       .map { |registration| registration.player.name }
                       .sort
                       .map { |name| { name: } }

      Rails.root.join('db', 'data', "players-#{year}.json").write(JSON.pretty_generate(json))
    end

    desc 'Load all players for a tour'
    task load: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      year = ENV.fetch('YEAR')

      data = JSON.parse(Rails.root.join('db', 'data', "players-#{year}.json").read)

      abort 'Year mismatch' if data['year'] != year

      data['players'].each do |player_data|
        player = Player.find_or_create_by!(name: player_data['name'])
        player.registrations.create!(year:)
      end
    end
  end

  namespace :results do
    desc 'Clear all results'
    task clear: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      tour = Tour.find_by!(year: ENV.fetch('YEAR', nil))
      tour.stages.each do |stage|
        stage.stage_results.each { |result| result.player_rider_stage_points.each(&:delete) }
        stage.stage_results.delete_all
      end
      tour.riders.delete_all
      tour.overall_results.each { |result| result.player_rider_points.each(&:delete) }
      tour.overall_results.delete_all
      tour.stages.update_all(results_downloaded_at: nil) # rubocop:disable Rails/SkipsModelValidations

      OverallResult.where(tour: nil).delete_all
    end

    desc 'Load all results for a tour'
    task load: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      year = ENV.fetch('YEAR', nil)
      Tour.find_by!(year:).stages.where(results_downloaded_at: nil).order(:date).each do |stage|
        puts "Loading #{year} Stage #{stage.number} #{stage.date}"
        StageResultsUpdater.new.perform(stage.id)
      end
    end

    desc 'Force reload of all results'
    task reload: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      # rubocop:disable Rails/SkipsModelValidations
      Tour.find_by!(year: ENV.fetch('YEAR', nil)).stages.update_all(results_downloaded_at: nil)
      # rubocop:enable Rails/SkipsModelValidations
    end

    desc 'Show result syncing status'
    task status: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      tour = Tour.find_by!(year: ENV.fetch('YEAR', nil))
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

  namespace :stages do
    desc 'Dump all stages for a tour'
    task dump: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      year = ENV.fetch('YEAR')

      stage_keys = %w[id created_at updated_at tour_id results_downloaded_at]

      tour = Tour.find_by!(year:)
      json = tour.as_json
      %w[id created_at updated_at].each { |key| json.delete(key) }
      json['stages'] = tour.stages.order(:number).map do |stage|
        stage = stage.as_json
        stage_keys.each { |key| stage.delete(key) }
        stage
      end

      Rails.root.join('db', 'data', "stages-#{year}.json").write(JSON.pretty_generate(json))
    end

    desc 'Load all stages for a tour'
    task load: :environment do
      abort 'YEAR must be specified' unless ENV['YEAR']

      year = ENV.fetch('YEAR').to_i

      data = JSON.parse(Rails.root.join('db', 'data', "stages-#{year}.json").read)

      abort 'Year mismatch' if data['year'] != year

      ActiveRecord::Base.transaction do
        tour = Tour.create!(year: data['year'], start_date: data['start_date'], finish_date: data['finish_date'])

        data['stages'].each do |stage_data|
          tour.stages.create!(
            number: stage_data['number'],
            date: stage_data['date'],
            start_town: stage_data['start_town'],
            start_country: stage_data['start_country'],
            finish_town: stage_data['finish_town'],
            finish_country: stage_data['finish_country'],
            distance: stage_data['distance'],
            stage_type: stage_data['stage_type'],
            game_stage: stage_data['game_stage'],
          )
        end
      end
    end
  end
end
