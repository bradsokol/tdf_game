# frozen_string_literal: true

class StageResultsParser
  class << self
    def perform(html:, stage_result:)
      data = html.xpath('//pre').text.split("\n")[2]
      rank, points = /^ *([\d]+)\. *([\d]+) /.match(data).to_a[1..-1].map(&:to_i)
      stage_result.overall_rank = rank
      stage_result.points = points
      stage_result
    end
  end
end
