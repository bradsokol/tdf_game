# frozen_string_literal: true

class TeamResultsParser
  Rider = Struct.new(:ordinal, :name, :total_points, :daily_points)
  TeamResults = Struct.new(:riders, :total_points, :percentiles)

  class << self
    def perform(html:)
      data = html.xpath('//pre').text.split("\n")[5..22]

      riders = data[1..15].map { |rider_line| parse_rider(rider_line) }
      total_points = parse_points(data[16])
      percentiles = parse_percentiles(data[17])
      TeamResults.new(riders, total_points, percentiles)
    end

    private

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

    def parse_rider(line)
      ordinal, name, total_points, daily_points = /^ *([\d]+)\. ([^\d]+)([\d]+) (.+)$/.match(line).to_a[1..]

      daily_points = daily_points
                     .gsub(/\s+/m, ' ')
                     .strip
                     .split(' ')
                     .map { |p| p == '.' ? 0 : p.to_i }

      Rider.new(
        ordinal.to_i,
        name.strip,
        total_points.to_i,
        daily_points,
      )
    rescue StandardError
      Rails.logger.error("[TeamResults] Failed to parse rider: #{line}")
      raise
    end
  end
end
