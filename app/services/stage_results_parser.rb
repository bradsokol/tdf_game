# frozen_string_literal: true

class StageResultsParser
  class << self
    def perform(html:, stage_result:)
      data = html.xpath('//pre').text.split("\n")[2]
      rank, points = parse_line(data)
      stage_result.overall_rank = rank
      stage_result.points = points
      stage_result
    end

    private

    def parse_line(line)
      /^ *([\d]+)\. *([\d]+) /.match(line).to_a[1..].map(&:to_i)
    rescue StandardError
      Rails.logger.error("[StageResults] Failed to parse stage results: #{line}")
      raise
    end
  end
end
