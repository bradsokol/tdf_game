# typed: true
# frozen_string_literal: true

class StageResultsParser
  extend T::Sig

  class << self
    extend T::Sig

    sig { params(html: Nokogiri::HTML::Document, stage_result: StageResult).returns(StageResult) }
    def perform(html:, stage_result:)
      data = html.xpath('//pre').text.split("\n")[2]
      rank, points = parse_line(data)
      stage_result.overall_rank = rank
      stage_result.points = points
      stage_result
    end

    private

    sig { params(line: String).returns(T::Array[Integer]) }
    def parse_line(line)
      T.must(/^ *(\d+)\. *(\d+) /.match(line).to_a[1..]).map(&:to_i)
    rescue StandardError
      Rails.logger.error("[StageResults] Failed to parse stage results: #{line}")
      raise
    end
  end
end
