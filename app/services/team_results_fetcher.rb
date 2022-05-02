# frozen_string_literal: true

class TeamResultsFetcher
  class << self
    def perform(year:, player_name:)
      url = "https://ifarm.nl/cgi-bin/getpart.cgi?SEARCH=#{CGI.escape(player_name)}&YEAR=#{year}"
      Rails.logger.debug("Fetching team results from: #{url}")
      html = Nokogiri::HTML(URI.parse(url).open)

      TeamResultsParser.perform(html:)
    end
  end
end
