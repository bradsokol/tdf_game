# frozen_string_literal: true

module Admin
  class ResultsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_tour

    def index
      @stages = @tour.game_stages
      @stage_needing_results = Stage.need_results.first
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
  end
end
