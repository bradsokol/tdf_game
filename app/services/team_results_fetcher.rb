# frozen_string_literal: true

class TeamResultsFetcher
  class << self
    def perform(year:, player_name:)
      url = "https://ifarm.nl/cgi-bin/getpart.cgi?SEARCH=#{CGI.escape(player_name)}&YEAR=#{year}"
      Rails.logger.debug("Fetching team results from: #{url}")
      uri = URI(url)
      request = Net::HTTP::Get.new(uri)
      response = Net::HTTP.start(
        uri.host,
        uri.port,
        use_ssl: uri.scheme == 'https',
        verify_mode: OpenSSL::SSL::VERIFY_NONE
      ) do |https|
        https.request(request)
      end

      raise response.message unless response.is_a?(Net::HTTPSuccess)

      html = Nokogiri::HTML(response.body)

      TeamResultsParser.perform(html:)
    end
  end
end
