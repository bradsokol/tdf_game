# typed: true
# frozen_string_literal: true

class ScheduleStageResultsFetchJob < ApplicationJob
  extend T::Sig

  queue_as :default

  sig { void }
  def perform
    stages_needing_results.each do |stage|
      ::StageResultsFetchJob.perform_later(stage.id)
    end
  end

  private

  sig { returns(T::Array[Stage]) }
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
    end.to_a
  end
end
