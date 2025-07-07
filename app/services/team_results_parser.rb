# typed: true
# frozen_string_literal: true

class TeamResultsParser
  extend T::Sig

  Rider = Struct.new(:ordinal, :name, :total_points, :stage_points)
  TeamResults = Struct.new(:riders, :total_points, :stage_points, :overall_percentile, :stage_percentiles)

  class << self
    extend T::Sig

    sig { params(html: Nokogiri::HTML::Document).returns(TeamResults) }
    def perform(html:)
      data = html.xpath('//pre').text.split("\n")[5..22]

      stage_numbers = parse_stage_numbers(data[0])
      riders = data[1..15].map { |rider_line| parse_rider(stage_numbers, rider_line) }.compact
      points = parse_points(data[16])
      percentiles = parse_percentiles(data[17])
      TeamResults.new(
        riders,
        points[0],
        stage_numbers.zip(T.must(points[1..])).to_h,
        percentiles[0],
        stage_numbers.zip(T.must(percentiles[1..])).to_h
      )
    end

    private

    sig { params(points: String).returns(T.nilable(Integer)) }
    def format_points(points)
      case points
      when '.'
        0
      when '*'
        nil
      else
        points.to_i
      end
    end

    sig { params(line: String).returns(T::Array[Integer]) }
    def parse_percentiles(line)
      T.must(/^.*Percentiles: *(.+)$/.match(line).to_a[1]).split.map(&:to_i)
    rescue StandardError
      Rails.logger.error("[TeamResults] Failed to parse percentiles: #{line}")
      raise
    end

    sig { params(line: String).returns(T::Array[Integer]) }
    def parse_points(line)
      T.must(/^.*Points: *(.+)$/.match(line).to_a[1]).split.map(&:to_i)
    rescue StandardError
      Rails.logger.error("[TeamResults] Failed to parse point totals: #{line}")
      raise
    end

    sig { params(stage_numbers: T::Array[Integer], line: String).returns(T.nilable(Rider)) }
    def parse_rider(stage_numbers, line)
      ordinal, name, total_points, daily_points = /^ *(\d+)\. ([^\d]+)(\d+) (.+)$/.match(line).to_a[1..]
      return nil unless name.present?

      daily_points = T.must(daily_points)
                      .gsub(/\s+/m, ' ')
                      .strip
                      .split
                      .map { |p| format_points(p) }

      Rider.new(
        ordinal.to_i,
        T.must(name).strip,
        total_points.to_i,
        stage_numbers.zip(daily_points).to_h,
      )
    rescue StandardError
      Rails.logger.error("[TeamResults] Failed to parse rider: #{line}")
      raise
    end

    sig { params(line: String).returns(T::Array[Integer]) }
    def parse_stage_numbers(line)
      T.must(/^ +tot +(.+)$/.match(line).to_a[1]).split.map(&:to_i)
    rescue StandardError
      Rails.logger.error("[TeamResults] Failed to parse stage numbers: #{line}")
      raise
    end
  end
end
