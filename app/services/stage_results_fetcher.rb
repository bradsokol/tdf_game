# frozen_string_literal: true

class StageResultsFetcher
  PlayerResults = Struct.new(:overall_result, :stage_result)

  class << self
    def perform(stage_date:, player_name:, overall_result:, stage_result:)
      query_date = stage_date.strftime('%Y%m%d')
      url = "https://ifarm.nl/cgi-bin/getlines.cgi?DATE=#{query_date}&SEARCH=#{CGI.escape(player_name)}"
      html = Nokogiri::HTML(URI.parse(url).open)

      PlayerResults.new(
        OverallResultsParser.perform(html: html, overall_result: overall_result),
        StageResultsParser.perform(html: html, stage_result: stage_result),
      )
    end
  end
end
