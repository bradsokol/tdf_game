# typed: true
# frozen_string_literal: true

class StageResultsFetchJob < ApplicationJob
  extend T::Sig

  queue_as :default

  sig { params(stage_id: Integer).void }
  def perform(stage_id)
    StageResultsUpdater.new.perform(stage_id)
  end
end
