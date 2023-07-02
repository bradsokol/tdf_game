# frozen_string_literal: true

class ScheduleStageResultsFetchJob < ApplicationJob
  queue_as :default

  def perform
    stages_needing_results.each do |stage|
      ::StageResultsFetchJob.perform_later(stage.id)
    end
  end

  private

  def stages_needing_results
    today = Time.zone.today
    Stage.need_results.select do |stage|
      if stage.date > today
        false
      elsif stage.date < today
        true
      else
        Time.now.utc.hour >= 16
      end
    end
  end
end
