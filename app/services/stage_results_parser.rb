# frozen_string_literal: true

class StageResultsParser
  class << self
    def perform(html:)
      data = html.xpath('//pre').text.split("\n")[2]
      stage_rank, stage_points = /^ *([\d]+)\. *([\d]+) /.match(data).to_a[1..-1].map(&:to_i)
      StageResult.new(overall_rank: stage_rank, points: stage_points)
    end
  end
end
