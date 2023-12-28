# typed: false
# frozen_string_literal: true

require 'test_helper'

class StageResultsFetchJobTest < ActiveJob::TestCase
  extend T::Sig

  test '#perform calls stage results updater' do
    stage_id = 123
    StageResultsUpdater.any_instance.expects(:perform).with(stage_id)

    StageResultsFetchJob.perform_now(stage_id)
  end
end
