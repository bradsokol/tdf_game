# frozen_string_literal: true

class TeamResultsParser
  Rider = Struct.new(:ordinal, :name, :total_points, :stage_points)
  TeamResults = Struct.new(:riders, :total_points, :stage_points, :overall_percentile, :stage_percentiles)

  class << self
    def perform(html:)
      data = html.xpath('//pre').text.split("\n")[5..22]

      stage_numbers = parse_stage_numbers(data[0])
      riders = data[1..15].map { |rider_line| parse_rider(stage_numbers, rider_line) }
      points = parse_points(data[16])
      percentiles = parse_percentiles(data[17])
      TeamResults.new(
        riders,
        points[0],
        stage_numbers.zip(points[1..]).to_h,
        percentiles[0],
        stage_numbers.zip(percentiles[1..]).to_h
      )
    end

    private

    def format_points(points)
      if points == '.'
        0
      elsif points == '*'
        nil
      else
        points.to_i
      end
    end

    def parse_percentiles(line)
      /^.*Percentiles: *(.+)$/.match(line).to_a[1].split.map(&:to_i)
    rescue StandardError
      Rails.logger.error("[TeamResults] Failed to parse percentiles: #{line}")
      raise
    end

    def parse_points(line)
      /^.*Points: *(.+)$/.match(line).to_a[1].split.map(&:to_i)
    rescue StandardError
      Rails.logger.error("[TeamResults] Failed to parse point totals: #{line}")
      raise
    end

    def parse_rider(stage_numbers, line)
      ordinal, name, total_points, daily_points = /^ *(\d+)\. ([^\d]+)(\d+) (.+)$/.match(line).to_a[1..]

      daily_points = daily_points
                     .gsub(/\s+/m, ' ')
                     .strip
                     .split(' ')
                     .map { |p| format_points(p) }

      Rider.new(
        ordinal.to_i,
        name.strip,
        total_points.to_i,
        stage_numbers.zip(daily_points).to_h,
      )
    rescue StandardError
      Rails.logger.error("[TeamResults] Failed to parse rider: #{line}")
      raise
    end

    def parse_stage_numbers(line)
      /^ +tot +(.+)$/.match(line).to_a[1].split.map(&:to_i)
    rescue StandardError
      Rails.logger.error("[TeamResults] Failed to parse stage numbers: #{line}")
      raise
    end
  end
end
