# frozen_string_literal: true

class StageResultsFetcher
  class << self
    def perform(stage_date:, player_name:, stage_result:)
      query_date = stage_date.strftime('%Y%m%d')
      url = "https://ifarm.nl/cgi-bin/getlines.cgi?DATE=#{query_date}&SEARCH=#{CGI.escape(player_name)}"
      StageResultsParser.perform(html: Nokogiri::HTML(URI.parse(url).open), stage_result: stage_result)
    end
  end
end
