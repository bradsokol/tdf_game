# frozen_string_literal: true

module Admin
  class ResultsController < AuthenticatedController
    before_action :find_tour

    def index
      @stages = @tour.game_stages.reject { |stage| stage.date.future? }
      @stage_needing_results = Stage.need_results.first
      @results_available = results_available?(@stage_needing_results) if @stage_needing_results.present?
    end

    def update
      stage_id = params[:stage]
      stage = Stage.find(stage_id)
      stage.update!(results_downloaded_at: nil)
      StageResultsUpdater.new.perform(stage.id)

      redirect_to admin_results_path, notice: 'Results updated'
    rescue StandardError => e
      redirect_to admin_results_path, notice: "FAILED: #{e}"
    end

    private

    def find_tour
      @tour = Tour.all.order(year: :desc).first
    end

    def results_available?(stage)
      date_params = { year: stage.date.year, month: stage.date.month, day: stage.date.day }
      @results_url = format('https://ifarm.nl/tdf/%<year>04d%<month>02d%<day>02d.html', date_params)
      uri = URI(@results_url)
      request = Net::HTTP::Get.new(uri.path)
      response = Net::HTTP.start(
        uri.host,
        uri.port,
        use_ssl: uri.scheme == 'https',
        verify_mode: OpenSSL::SSL::VERIFY_NONE
      ) do |https|
        https.request(request)
      end

      month = stage.date.month == 6 ? 'June' : 'July'
      response.is_a?(Net::HTTPSuccess) && response.body.include?("#{month} #{stage.date.day}")
    end
  end
end
