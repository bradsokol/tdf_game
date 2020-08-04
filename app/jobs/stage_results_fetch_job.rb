# frozen_string_literal: true

class StageResultsFetchJob < ApplicationJob
  queue_as :default

  def perform(stage_id)
    StageResultsUpdater.new.perform(stage_id)
  end
end
