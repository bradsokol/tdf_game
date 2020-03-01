# frozen_string_literal: true

class OverallResultsParser
  class << self
    def perform(html:, overall_result:)
      data = html.xpath('//pre').text.split("\n")
      offset = data.length == 8 ? 1 : 0
      line = data[4 + offset]
      if line
        #   29. (37) 265(+75,-47)  Brad Sokol (Canada)
        regex = /^ *([\d]+)\. ?\(([\d]+)\) *([\d]+) *\(([+-]?[\d]+),([-]?[\d]+)\)/
        overall_rank, previous_rank, points, _delta, behind, _name = regex.match(line).to_a[1..-1].map(&:to_i)
        overall_result.overall_rank = overall_rank
        overall_result.previous_rank = previous_rank
        overall_result.points = points
        overall_result.gap = behind
      end
      overall_result
    end
  end
end
