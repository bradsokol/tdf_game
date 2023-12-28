# typed: true
# frozen_string_literal: true

class OverallResultsParser
  extend T::Sig

  class << self
    extend T::Sig

    sig { params(html: Nokogiri::HTML::Document, overall_result: OverallResult).returns(OverallResult) }
    def perform(html:, overall_result:)
      data = html.xpath('//pre').text.split("\n")
      offset = data.length == 8 ? 1 : 0
      line = data[4 + offset]
      if line
        overall_rank, previous_rank, points, _delta, behind, _name = parse_line(line)
        overall_result.overall_rank = overall_rank
        overall_result.previous_rank = previous_rank.nil? || previous_rank.zero? ? nil : previous_rank
        overall_result.points = points
        overall_result.gap = behind
      end
      overall_result
    end

    private

    sig { params(line: String).returns(T::Array[Integer]) }
    def parse_line(line)
      #   29. (37) 265(+75,-47)  Brad Sokol (Canada)
      regex = /^ *(\d+)\. *?\((-|\d+)\) *(\d+) *\(([+-]?\d+),(-?\d+)\)/
      T.must(regex.match(line).to_a[1..]).map(&:to_i)
    rescue StandardError
      Rails.logger.error("[OverallResults] Failed to parse overall results: #{line}")
      raise
    end
  end
end
