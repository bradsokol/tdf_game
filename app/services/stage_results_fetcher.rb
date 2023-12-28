# typed: true
# frozen_string_literal: true

class StageResultsFetcher
  extend T::Sig

  PlayerResults = Struct.new(:overall_result, :stage_result)

  class << self
    extend T::Sig

    sig do
      params(
        stage_date: Date,
        player_name: String,
        overall_result: OverallResult,
        stage_result: StageResult
      )
        .returns(PlayerResults)
    end
    def perform(stage_date:, player_name:, overall_result:, stage_result:)
      query_date = stage_date.strftime('%Y%m%d')
      url = "https://ifarm.nl/cgi-bin/getlines.cgi?DATE=#{query_date}&SEARCH=#{CGI.escape(player_name)}"
      Rails.logger.debug { "Fetching stage results from: #{url}" }
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
      overall_result.date = stage_date

      PlayerResults.new(
        OverallResultsParser.perform(html:, overall_result:),
        StageResultsParser.perform(html:, stage_result:),
      )
    end
  end
end
