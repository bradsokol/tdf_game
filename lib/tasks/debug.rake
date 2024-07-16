# typed: false
# frozen_string_literal: true

desc 'Task to run debugging code'
task debug: :environment do
  url = 'https://ifarm.nl/cgi-bin/getpart.cgi?SEARCH=Kevin%20Blick&YEAR=2024'
  uri = URI(url)
  previous_data = nil

  request = Net::HTTP::Get.new(uri)

  10.times do
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
    data = html.xpath('//pre').text.split("\n")[5..22]

    raise 'Mismatch' if !previous_data.nil? && (data != previous_data)

    previous_data = data
  end
end
