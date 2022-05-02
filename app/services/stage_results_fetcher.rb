# frozen_string_literal: true

class StageResultsFetcher
  PlayerResults = Struct.new(:overall_result, :stage_result)

  class << self
    def perform(stage_date:, player_name:, overall_result:, stage_result:)
      query_date = stage_date.strftime('%Y%m%d')
      url = "https://ifarm.nl/cgi-bin/getlines.cgi?DATE=#{query_date}&SEARCH=#{CGI.escape(player_name)}"
      Rails.logger.debug("Fetching stage results from: #{url}")
      html = Nokogiri::HTML(URI.parse(url).open)
      overall_result.date = stage_date

      PlayerResults.new(
        OverallResultsParser.perform(html:, overall_result:),
        StageResultsParser.perform(html:, stage_result:),
      )
    end
  end
end
